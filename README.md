# Momoxo API

## How to deploy

git clone from GitHub.

```
hub clone momoxo-project/api
```

Update doccumentation and deploy.

```
cd api
git submodule update --init
hub clone -p -b gh-pages momoxo-project/api _deploy
./makedoc.sh
```

Have fun :)


