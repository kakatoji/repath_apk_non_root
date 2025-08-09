.class public Lcom/inject/FridaLoader;
.super Ljava/lang/Object;

.method public static init()V
    .locals 1

    const-string v0, "frida-gadget"
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method
