# Generated by Django 4.2 on 2023-10-18 06:54

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('hmsrest', '0003_recipeitem_delete_recipeitems_alter_recipe_items'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='dish',
            name='items',
        ),
        migrations.RemoveField(
            model_name='dish',
            name='recipes',
        ),
        migrations.RemoveField(
            model_name='report',
            name='user',
        ),
        migrations.RemoveField(
            model_name='transaction',
            name='daily_menus',
        ),
        migrations.RemoveField(
            model_name='transaction',
            name='items',
        ),
        migrations.RemoveField(
            model_name='transaction',
            name='user',
        ),
        migrations.DeleteModel(
            name='DailyMenu',
        ),
        migrations.DeleteModel(
            name='Dish',
        ),
        migrations.DeleteModel(
            name='Report',
        ),
        migrations.DeleteModel(
            name='Transaction',
        ),
    ]
