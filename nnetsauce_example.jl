using Pkg
ENV["PYTHON"] = ""  # replace with your Python path
Pkg.add("PyCall")
Pkg.build("PyCall")
Pkg.add("Conda")
Pkg.build("Conda")

using PyCall
using Conda

Conda.add("pip")  # Ensure pip is installed
Conda.pip_interop(true)  # Enable pip interop
Conda.pip("install", "scikit-learn")  # Install scikit-learn
Conda.pip("install", "jax")  # /!\ Only on Linux or macOS: Install jax
Conda.pip("install", "jaxlib")  # /!\ Only on Linux or macOS: Install jaxlib
Conda.pip("install", "nnetsauce")  # Install nnetsauce
Conda.add("numpy")

np = pyimport("numpy")
ns = pyimport("nnetsauce")
sklearn = pyimport("sklearn")


# 1 - breast cancer dataset

dataset = sklearn.datasets.load_breast_cancer()

X = dataset["data"]
y = dataset["target"]

X_train, X_test, y_train, y_test = sklearn.model_selection.train_test_split(X, y, test_size=0.2, random_state=123)

clf = ns.Ridge2MultitaskClassifier(n_hidden_features=9, dropout=0.43, n_clusters=1, 
lambda1=1.24023438e+01, lambda2=7.30263672e+03)

@time clf.fit(X=X_train, y=y_train) # timing?

print("\n\n Model parameters: \n\n")
print(clf.get_params())

print("\n\n Testing score: \n\n")
print(clf.score(X_test, y_test))
print("\n\n")


# 2 - wine dataset

dataset = sklearn.datasets.load_wine()

X = dataset["data"]
y = dataset["target"]

X_train, X_test, y_train, y_test = sklearn.model_selection.train_test_split(X, y, test_size=0.2, random_state=123)

clf = ns.Ridge2MultitaskClassifier(n_hidden_features=15,
dropout=0.1, n_clusters=3, 
type_clust="gmm")

@time clf.fit(X=X_train, y=y_train) # timing?

print("\n\n Model parameters: \n\n")
print(clf.get_params())

print("\n\n Testing score: \n\n")
print(clf.score(X_test, y_test))
print("\n\n")
