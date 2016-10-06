# android-quality-starter
setup CheckStyle, FindBugs, PMD and Lint for your Android project easily

This projects adds gradle setup for quality tools mentioned above to your project via shell script. After adding this, you can easily increase quality of your project by static code analysis.

usage
-----

Go to main directory of your Android project and run:

```
curl https://raw.githubusercontent.com/pwittchen/android-quality-starter/master/install.sh | sh
```

Then wait for a while and follow short instruction in the end for quick manual setup.

Remember to add line:

```
apply from: '../config/quality.gradle'
```

to `build.gradle` of the module you want to check.

Then you can execute the following command in the main directory of the project:

```
./gradlew check
```

references
----------
- https://github.com/vincentbrison/vb-android-app-quality
