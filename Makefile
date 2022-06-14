# ---- Setup project
install:
	poetry install

# ---- Database
migrations:
	poetry run python manage.py makemigrations

migrate:
	poetry run python manage.py migrate

check-migrations:
	poetry run python manage.py migrate --fake

flush:
	poetry run python manage.py flush

load-fixtures:
	poetry run python manage.py loaddata task_manager/fixtures/labels.yaml; \
	poetry run python manage.py loaddata task_manager/fixtures/statuses.yaml

# ---- Linter, Tests
lint:
	poetry run flake8

test:
	echo poetry run coverage run --source '.' manage.py test task_manager/apps/

# ---- Django shell
django-shell:
	poetry run python manage.py shell

# ---- Run
run:
	poetry run python manage.py runserver