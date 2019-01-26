pypkg:
	cd ./sample && python setup.py sdist bdist_wheel
pypiserver:
	docker build -t lol .
	docker run -p 8000:8080 lol
sampleinstall:
	pip uninstall -y sample
	pip install --index-url=http://localhost:8000/simple sample



	