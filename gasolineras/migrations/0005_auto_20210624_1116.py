# Generated by Django 3.0.8 on 2021-06-24 17:16

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gasolineras', '0004_auto_20210618_2329'),
    ]

    operations = [
        migrations.RenameField(
            model_name='precios',
            old_name='id',
            new_name='id_precio',
        ),
    ]
