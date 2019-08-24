# Lambduh

Docker scaffolding intended to simplify developing lambda functions using python's runtime environment.

Process largely prescribed here: https://docs.aws.amazon.com/lambda/latest/dg/lambda-python-how-to-create-deployment-package.html

Simply provide a `requirements.txt` file along with your lamdba function
in a repository or folder within the `functions/` directory and invoke the
build script `sbin/build.sh`.

requirements:
  - docker


Clone or copy any function into place:

```
# Cloning a remote package to build:
git clone https://github.com/scub/lmb-badexample.git functions/lmb-badexample

# Copying a local project in for building:
cp -vr /path/to/lmb-project ./functions/lmb-project
```

  By running the build script in `./sbin/build.sh`, all functions present within
the `./functions/` directory will have deployable lambda packages in the `./build/`
directory stored as zip files that can be uploaded via the `aws` CLI as shown below
or deployed using terraform.

```
# Clone a project containing its dependencies within `requirements.txt` as the example shows:
git clone https://github.com/scub/lmb-badexample.git functions/lmb-badexample

# Generate your lambda packages
./sbin/build.sh

# Get our function name
aws lambda list-functions | jq ".Functions"

# Update the function definition with our new package
aws lambda update-function-code --function-name lmb-badexample --zip-file fileb://build/lmb-badexample.zip
```
