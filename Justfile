help:
    @just --list

clean:
    rm -rf build

compile: clean
    javac \
        -d build/javac \
        --module-source-path "./*/src" \
        --module example.mod,other.mod

package: compile
    jar --create \
        --file build/jar/example.mod.jar \
        --main-class example.mod.A \
        -C build/javac/example.mod . \
        -C example.mod/res .

    jar --create \
        --file build/jar/other.mod.jar \
        -C build/javac/other.mod .

run: package
    java --module-path build/jar --module example.mod

document:
    javadoc \
        -d build/javadoc \
        --module-source-path "./*/src" \
        --module example.mod,other.mod