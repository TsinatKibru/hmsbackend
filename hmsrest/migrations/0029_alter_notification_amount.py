# Generated by Django 4.2 on 2023-11-09 07:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('hmsrest', '0028_alter_item_price_alter_item_quantity_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='notification',
            name='amount',
            field=models.DecimalField(decimal_places=3, max_digits=10),
        ),
    ]
