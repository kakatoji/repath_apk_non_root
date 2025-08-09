.class public Lcom/frida/MyApp;
.super Landroid/app/Application;

.method static constructor <clinit>()V
    .registers 1
    const-string v0, "frida-gadget"
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    return-void
.end method

.method public onCreate()V
    .registers 1
    invoke-super {p0}, Landroid/app/Application;->onCreate()V
    return-void
.end method
