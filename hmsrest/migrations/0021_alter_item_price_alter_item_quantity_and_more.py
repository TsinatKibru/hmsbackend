# Generated by Django 4.2 on 2023-11-09 07:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('hmsrest', '0020_alter_notification_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='item',
            name='price',
            field=models.DecimalField(decimal_places=5, max_digits=10),
        ),
        migrations.AlterField(
            model_name='item',
            name='quantity',
            field=models.DecimalField(decimal_places=5, max_digits=10),
        ),
        migrations.AlterField(
            model_name='purchase',
            name='quantity',
            field=models.DecimalField(decimal_places=5, max_digits=10),
        ),
    ]
