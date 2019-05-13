# A fork of Cryptofuzz with an EverCrypt module

The Dockerfile is derived from the [Dockerfile in OSS-Fuzz](https://github.com/google/oss-fuzz/tree/master/projects/cryptofuzz).
It currently fuzzes the v0.1alpha1 EverCrypt release against libsodium with ASan.

Build it with e.g. 

```docker build -t oss-fuzz:cryptofuzz . && docker run --cap-add SYS_PTRACE -t oss-fuzz:cryptofuzz```

Once built, create a new image with 

```docker commit <container-id> oss-fuzz:cryptofuzz-built``` 

and start fuzzing with

```docker run --cap-add SYS_PTRACE -t oss-fuzz:cryptofuzz-built /src/fuzz.sh```
