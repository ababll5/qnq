# Generated by Django 5.1.2 on 2024-12-12 07:35

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("tour", "0007_alter_score_options_food_comment_rating"),
    ]

    operations = [
        migrations.AlterField(
            model_name="food",
            name="food_rate",
            field=models.CharField(
                blank=True, max_length=5, null=True, verbose_name="美食评分"
            ),
        ),
    ]