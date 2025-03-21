# Generated by Django 4.2 on 2023-11-09 07:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('hmsrest', '0027_alter_item_quantity_alter_item_threshold_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='item',
            name='price',
            field=models.DecimalField(decimal_places=3, default=0, max_digits=10),
        ),
        migrations.AlterField(
            model_name='item',
            name='quantity',
            field=models.DecimalField(decimal_places=3, default=0, max_digits=10),
        ),
        migrations.AlterField(
            model_name='item',
            name='threshold',
            field=models.DecimalField(decimal_places=3, default=0, max_digits=10),
        ),
        migrations.AlterField(
            model_name='purchase',
            name='quantity',
            field=models.DecimalField(decimal_places=3, default=0, max_digits=10),
        ),
    ]
