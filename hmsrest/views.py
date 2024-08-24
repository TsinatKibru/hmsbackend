from decimal import Decimal
from django.db import IntegrityError
from django.core.exceptions import ValidationError
from .models import Order
from .serializers import OrderSerializer
from .models import DailyMenu
from .serializers import DailyMenuSerializer, ItemSerializerfortransfer
from .models import Recipe, RecipeItem
from rest_framework import generics, status
from .models import Recipe
from .models import ItemTransfer
from django.shortcuts import get_object_or_404
from rest_framework import generics, permissions
from .serializers import RecipeSerializer
from rest_framework.generics import ListAPIView, ListCreateAPIView, RetrieveUpdateDestroyAPIView
from .serializers import ItemTransferSerializer
from django.contrib.contenttypes.models import ContentType
from .serializers import NotificationSerializer, DishSerializer
from .models import Notification
import json
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
from django.views.decorators.http import require_POST
from .serializers import ItemSerializer, PurchaseSerializer
from .models import Item, Purchase
from .serializers import RefreshTokenSerializer
from .serializers import TokenVerificationSerializer
from rest_framework_simplejwt.tokens import AccessToken
from .serializers import UserLoginSerializer
from rest_framework import generics
from rest_framework.generics import CreateAPIView
from .models import Item, Dish, DishItem, DishRecipe
from .serializers import ItemSerializer, DailyMenuSerializer2, NotificationDetailSerializer

from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken
from .models import CustomUser


from .serializers import CustomUserSerializer


class UserRegistrationAPIView(CreateAPIView):
    serializer_class = CustomUserSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        return Response({"message": "User registered successfully."}, status=status.HTTP_201_CREATED)


class UserLoginAPIView(CreateAPIView):
    serializer_class = UserLoginSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        refresh = RefreshToken.for_user(user)

        return Response({
            'refresh': str(refresh),
            'access': str(refresh.access_token),
            'role': user.role,
        }, status=status.HTTP_200_OK)


class TokenVerificationAPIView(CreateAPIView):
    serializer_class = TokenVerificationSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        token = serializer.validated_data['token']

        try:
            decoded_token = AccessToken(token)
            user_id = decoded_token['user_id']
            user = CustomUser.objects.get(id=user_id)
            return Response({"user_id": user_id, "role": user.role}, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)


class ObtainAccessTokenAPIView(CreateAPIView):
    serializer_class = RefreshTokenSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        refresh = serializer.validated_data['refresh']

        try:
            refresh_token = RefreshToken(refresh)
            access_token = refresh_token.access_token
            return Response({"access": str(access_token)}, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)


# from decimal import Decimal

class RecipeListCreateAPIView(generics.ListCreateAPIView):
    queryset = Recipe.objects.all()
    serializer_class = RecipeSerializer

    def create(self, request, *args, **kwargs):
        # Extract the items data from the request
        items_data = request.data.pop('items', [])

        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)

        # Create RecipeItem instances and calculate cost and theoretical quantity
        recipe = serializer.instance
        cost = Decimal('0')
        used_quantity_sum = Decimal('0')

        for item_data in items_data:
            item_id = item_data['id']
            used_quantity = Decimal(str(item_data['used_quantity']))

            item = Item.objects.get(pk=item_id)

            # Create RecipeItem instance
            recipe_item = RecipeItem(
                recipe=recipe, item=item, used_quantity=used_quantity)
            recipe_item.save()

            # Calculate cost and sum used quantities
            cost += used_quantity * Decimal(str(item.price))
            used_quantity_sum += used_quantity

        # Update Recipe with calculated cost and theoretical quantity
        recipe.cost = cost
        recipe.theoretical_quantity = used_quantity_sum
        recipe.save()

        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)


class ItemRetrieveUpdateDestroyAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Item.objects.all()
    serializer_class = ItemSerializer


class ItemUpdateByNameAPIView(generics.UpdateAPIView):
    serializer_class = ItemSerializerfortransfer
    lookup_field = 'name'

    def get_queryset(self):
        name = self.kwargs['name']
        quantity = self.kwargs['quantity']
        try:
            item = Item.objects.get(name=name)
            item.quantity -= quantity
            item.save()
            return Item.objects.filter(id=item.id)
        except Item.DoesNotExist:
            return Item.objects.none()


class RetrieveItemByname(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = ItemSerializer
    lookup_field = 'name'

    def get_queryset(self):
        name = self.kwargs['name']
        try:
            return Item.objects.filter(name=name)
        except Item.DoesNotExist:
            return Item.objects.none()


class ItemListCreateView(generics.ListCreateAPIView):
    queryset = Item.objects.all()
    serializer_class = ItemSerializer

    def create(self, request, *args, **kwargs):
        itemname = request.data.get('name')
        existing_item = Item.objects.filter(name=itemname).first()
        if existing_item:
            serializer = self.get_serializer(
                instance=existing_item, data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_200_OK)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        try:
            return super().create(request, *args, **kwargs)
        except IntegrityError:
            return Response({'error': 'Could not create the item.'}, status=status.HTTP_400_BAD_REQUEST)
        except ValidationError as err:
            return Response({'error': err.detail}, status=status.HTTP_200_OK)


class ItemRetrieveUpdateDestroyAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Item.objects.all()
    serializer_class = ItemSerializer

    def partial_update(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)


class PurchaseUpdateView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Purchase.objects.all()
    serializer_class = PurchaseSerializer
    permission_classes = [permissions.IsAuthenticated]

    def partial_update(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)


class PurchaseListCreateAPIView(generics.ListCreateAPIView):
    queryset = Purchase.objects.all()
    serializer_class = PurchaseSerializer
    permission_classes = [permissions.IsAuthenticated]


class PurchaseListAPIView(generics.ListAPIView):
    queryset = Purchase.objects.all()
    serializer_class = PurchaseSerializer
    permission_classes = [permissions.IsAuthenticated]

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        data = serializer.data

        # Retrieve item details for each purchase
        item_ids = [purchase['item'] for purchase in data]
        items = Item.objects.filter(id__in=item_ids)
        item_dict = {item.id: item for item in items}

        # Update the serialized data with item details
        for purchase in data:
            item_id = purchase['item']
            purchase['item'] = ItemSerializer(item_dict[item_id]).data

        return Response(data)


# class PurchaseHistoryRemoveItemAPIView(generics.DestroyAPIView):
#     serializer_class = PurchaseHistorySerializer

#     def delete(self, request, *args, **kwargs):
#         purchase_id = self.kwargs.get('purchase_id')
#         item_id = self.kwargs.get('item_id')

#         try:
#             purchase = PurchaseHistory.objects.get(id=purchase_id)

#             item = Item.objects.get(id=item_id)
#             print("1", item.quantity)

#             # Deduct the quantity from the item in the database
#             item.quantity -= purchase.items.filter(id=item_id).first().quantity
#             purchase.items.remove(item)
#             print("2", item.quantity)
#             item.save()

#             return Response(status=204)
#         except (PurchaseHistory.DoesNotExist, Item.DoesNotExist):
#             return Response(status=404)


# @csrf_exempt
# @require_POST
# def approve_all_purchases(request):
#     try:
#         payload = json.loads(request.body)

#         purchase_ids = payload.get('purchase_ids', '')

#         if purchase_ids:
#             try:
#                 purchase_ids = purchase_ids.split(',')
#                 PurchaseHistory.objects.filter(
#                     id__in=purchase_ids).update(status='approved')
#                 return JsonResponse({'success': True})
#             except Exception as e:
#                 return JsonResponse({'success': False, 'error': str(e)})
#         else:
#             return JsonResponse({'success': False, 'message': 'No purchase IDs provided'})
#     except json.JSONDecodeError:
#         return JsonResponse({'success': False, 'message': 'Invalid JSON payload'})


class NotificationListCreateAPIView(generics.ListCreateAPIView):
    queryset = Notification.objects.all()
    serializer_class = NotificationSerializer

    def perform_create(self, serializer):
        role = self.request.data.get('role')
        # Assuming the entity name is passed in the request data
        entity_name = self.request.data.get('entity_type')
        recipient_users = CustomUser.objects.filter(role=role)

        # Get the ContentType based on the entity name
        entity_type = ContentType.objects.get(model=entity_name.lower())
        chanegdEntityName = Item.objects.get(
            id=self.request.data.get('entity_id'))

        serializer.save(
            recipient_user=recipient_users,
            entity_type_id=entity_type.id,
            chanegdEntityName=chanegdEntityName
        )


class NotificationDetailAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Notification.objects.all()
    serializer_class = NotificationDetailSerializer


class ItemTransferListCreateAPIView(ListCreateAPIView):
    queryset = ItemTransfer.objects.all()
    serializer_class = ItemTransferSerializer


class ItemTransferRetrieveUpdateDestroyAPIView(RetrieveUpdateDestroyAPIView):
    queryset = ItemTransfer.objects.all()
    serializer_class = ItemTransferSerializer


class RecipeDetailView(RetrieveUpdateDestroyAPIView):
    queryset = Recipe.objects.all()
    serializer_class = RecipeSerializer

    def update(self, request, *args, **kwargs):
        # Extract the items data from the request
        items_data = request.data.pop('items', [])

        serializer = self.get_serializer(
            instance=self.get_object(), data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)

        # Create or update RecipeItem instances and calculate cost and theoretical quantity
        recipe = serializer.instance
        cost = 0
        used_quantity_sum = 0

        for item_data in items_data:
            item_id = item_data.get('id')
            used_quantity = item_data.get('used_quantity')

            if item_id and used_quantity:
                try:
                    item = Item.objects.get(pk=item_id)
                except Item.DoesNotExist:
                    return Response(
                        {'error': f'Item with ID {item_id} does not exist.'},
                        status=status.HTTP_400_BAD_REQUEST
                    )

                # Check if a RecipeItem instance already exists for the given item and recipe
                recipe_item, created = RecipeItem.objects.get_or_create(
                    recipe=recipe, item=item, defaults={
                        'used_quantity': used_quantity}
                )

                # If the RecipeItem already exists, update the used_quantity
                if not created:
                    recipe_item.used_quantity = used_quantity
                    recipe_item.save()

                # Calculate cost and sum used quantities
                cost += used_quantity * item.price
                used_quantity_sum += used_quantity

        # Update Recipe with calculated cost and theoretical quantity
        recipe.cost = cost
        recipe.theoretical_quantity = used_quantity_sum
        recipe.save()

        return Response(serializer.data)


class DishListCreateAPIView(generics.ListCreateAPIView):
    queryset = Dish.objects.all()
    serializer_class = DishSerializer

    def create(self, request, *args, **kwargs):
        items_data = request.data.get('items', [])
        recipes_data = request.data.get('recipes', [])

        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        self.perform_create(serializer)

        # Create DishItem instances and associate them with the newly created Dish
        for item_data in items_data:
            item_id = item_data['id']
            used_quantity = item_data['quantity']

            if item_id and used_quantity:
                try:
                    item = Item.objects.get(pk=item_id)
                except Item.DoesNotExist:
                    return Response(
                        {'error': f'Item with ID {item_id} does not exist.'},
                        status=status.HTTP_400_BAD_REQUEST
                    )

                dish_item = DishItem(
                    dish=serializer.instance, item=item, quantity=used_quantity)
                dish_item.save()

        # Create DishRecipe instances and associate them with the newly created Dish
        for recipe_data in recipes_data:
            recipe_id = recipe_data['id']
            used_quantity = recipe_data['quantity']

            if recipe_id and used_quantity:
                try:
                    recipe = Recipe.objects.get(pk=recipe_id)
                except Recipe.DoesNotExist:
                    return Response(
                        {'error': f'Recipe with ID {recipe_id} does not exist.'},
                        status=status.HTTP_400_BAD_REQUEST
                    )

                dish_recipe = DishRecipe(
                    dish=serializer.instance, recipe=recipe, quantity=used_quantity)
                dish_recipe.save()

        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)


# class DishDetailView(RetrieveUpdateDestroyAPIView):
#     queryset = Dish.objects.all()
#     serializer_class = DishSerializer

class DishDetailView(RetrieveUpdateDestroyAPIView):
    queryset = Dish.objects.all()
    serializer_class = DishSerializer

    def update(self, request, *args, **kwargs):
        items_data = request.data.get('items', [])
        recipes_data = request.data.get('recipes', [])

        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(
            instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)

        self.perform_update(serializer)

        # Delete existing DishItem and DishRecipe instances associated with the Dish
        DishItem.objects.filter(dish=instance).delete()
        DishRecipe.objects.filter(dish=instance).delete()

        # Create DishItem instances and associate them with the updated Dish
        for item_data in items_data:
            item_id = item_data['id']
            used_quantity = item_data['quantity']

            if item_id and used_quantity:
                try:
                    item = Item.objects.get(pk=item_id)
                except Item.DoesNotExist:
                    return Response(
                        {'error': f'Item with ID {item_id} does not exist.'},
                        status=status.HTTP_400_BAD_REQUEST
                    )

                dish_item = DishItem(
                    dish=instance, item=item, quantity=used_quantity)
                dish_item.save()

        # Create DishRecipe instances and associate them with the updated Dish
        for recipe_data in recipes_data:
            recipe_id = recipe_data['id']
            used_quantity = recipe_data['quantity']

            if recipe_id and used_quantity:
                try:
                    recipe = Recipe.objects.get(pk=recipe_id)
                except Recipe.DoesNotExist:
                    return Response(
                        {'error': f'Recipe with ID {recipe_id} does not exist.'},
                        status=status.HTTP_400_BAD_REQUEST
                    )

                dish_recipe = DishRecipe(
                    dish=instance, recipe=recipe, quantity=used_quantity)
                dish_recipe.save()

        return Response(serializer.data)


class DailyMenuDetailView(RetrieveUpdateDestroyAPIView):
    queryset = DailyMenu.objects.all()
    serializer_class = DailyMenuSerializer


class DailyMenuListView(ListCreateAPIView):
    queryset = DailyMenu.objects.all()
    serializer_class = DailyMenuSerializer


class DailyMenuList(ListAPIView):
    queryset = DailyMenu.objects.all()
    serializer_class = DailyMenuSerializer2


class OrderDetailAPIView(RetrieveUpdateDestroyAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    lookup_field = 'orderId'


class OrderListAPIView(ListCreateAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer

    def create(self, request, *args, **kwargs):
        orderId = request.data.get('orderId')
        existing_order = Order.objects.filter(orderId=orderId).first()
        if existing_order:
            serializer = self.get_serializer(
                instance=existing_order, data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_200_OK)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        try:
            return super().create(request, *args, **kwargs)
        except IntegrityError:
            return Response({'error': 'Could not create the order.'}, status=status.HTTP_400_BAD_REQUEST)
        except ValidationError as err:
            return Response({'error': err.detail}, status=status.HTTP_200_OK)
