.class Lcom/android/server/PowerManagerService$18;
.super Ljava/lang/Object;
.source "PowerManagerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/PowerManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/PowerManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/PowerManagerService;)V
    .locals 0
    .parameter

    .prologue
    .line 2968
    iput-object p1, p0, Lcom/android/server/PowerManagerService$18;->this$0:Lcom/android/server/PowerManagerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 2970
    iget-object v0, p0, Lcom/android/server/PowerManagerService$18;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mScreenBrightness:Lcom/android/server/PowerManagerService$BrightnessState;
    invoke-static {v0}, Lcom/android/server/PowerManagerService;->access$6000(Lcom/android/server/PowerManagerService;)Lcom/android/server/PowerManagerService$BrightnessState;

    move-result-object v0

    const/16 v1, 0xff

    invoke-virtual {v0, v1}, Lcom/android/server/PowerManagerService$BrightnessState;->forceValueLocked(I)V

    .line 2971
    return-void
.end method