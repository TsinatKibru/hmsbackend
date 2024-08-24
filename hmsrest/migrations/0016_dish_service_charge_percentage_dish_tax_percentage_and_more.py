# Generated by Django 4.2 on 2023-11-03 13:40

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('hmsrest', '0015_purchase_remove_item_purchase_time_item_category_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='dish',
            name='service_charge_percentage',
            field=models.DecimalField(
                decimal_places=2, default=10, max_digits=5),
        ),
        migrations.AddField(
            model_name='dish',
            name='tax_percentage',
            field=models.DecimalField(
                decimal_places=2, default=15, max_digits=5),
        ),
        migrations.AddField(
            model_name='dish',
            name='totalcost',
            field=models.DecimalField(
                blank=True, decimal_places=2, max_digits=10, null=True),
        ),
        migrations.AddField(
            model_name='itemtransfer',
            name='transfer_date',
            field=models.DateTimeField(default=django.utils.timezone.now),
        ),
        migrations.AlterField(
            model_name='dish',
            name='error_margin',
            field=models.DecimalField(
                blank=True, decimal_places=2, max_digits=5, null=True),
        ),
        # Step 1: Temporarily change 'time' field to TextField
        migrations.AlterField(
            model_name='order',
            name='time',
            field=models.TextField(),
        ),
        # Step 2: Change 'time' field to DateTimeField
        migrations.AlterField(
            model_name='order',
            name='time',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]
