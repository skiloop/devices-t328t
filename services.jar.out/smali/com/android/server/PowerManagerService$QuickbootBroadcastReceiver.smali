.class final Lcom/android/server/PowerManagerService$QuickbootBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PowerManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/PowerManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "QuickbootBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/PowerManagerService;


# direct methods
.method private constructor <init>(Lcom/android/server/PowerManagerService;)V
    .locals 0
    .parameter

    .prologue
    .line 2938
    iput-object p1, p0, Lcom/android/server/PowerManagerService$QuickbootBroadcastReceiver;->this$0:Lcom/android/server/PowerManagerService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/PowerManagerService;Lcom/android/server/PowerManagerService$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 2938
    invoke-direct {p0, p1}, Lcom/android/server/PowerManagerService$QuickbootBroadcastReceiver;-><init>(Lcom/android/server/PowerManagerService;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 2941
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 2942
    .local v0, action:Ljava/lang/String;
    iget-object v1, p0, Lcom/android/server/PowerManagerService$QuickbootBroadcastReceiver;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mLocks:Lcom/android/server/PowerManagerService$LockList;
    invoke-static {v1}, Lcom/android/server/PowerManagerService;->access$501(Lcom/android/server/PowerManagerService;)Lcom/android/server/PowerManagerService$LockList;

    move-result-object v2

    monitor-enter v2

    .line 2943
    :try_start_0
    const-string v1, "android.intent.action.ACTION_QUICKBOOT_SHUTDOWN"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2944
    iget-object v1, p0, Lcom/android/server/PowerManagerService$QuickbootBroadcastReceiver;->this$0:Lcom/android/server/PowerManagerService;

    iget-object v3, p0, Lcom/android/server/PowerManagerService$QuickbootBroadcastReceiver;->this$0:Lcom/android/server/PowerManagerService;

    iget-boolean v3, v3, Lcom/android/server/PowerManagerService;->mAnimateScreenLights:Z

    iput-boolean v3, v1, Lcom/android/server/PowerManagerService;->mAnimateScreenLightsOrigin:Z

    .line 2945
    iget-object v1, p0, Lcom/android/server/PowerManagerService$QuickbootBroadcastReceiver;->this$0:Lcom/android/server/PowerManagerService;

    const/4 v3, 0x1

    iput-boolean v3, v1, Lcom/android/server/PowerManagerService;->mAnimateScreenLights:Z

    .line 2946
    iget-object v1, p0, Lcom/android/server/PowerManagerService$QuickbootBroadcastReceiver;->this$0:Lcom/android/server/PowerManagerService;

    const/4 v3, 0x1

    #setter for: Lcom/android/server/PowerManagerService;->mIsQbShutdown:Z
    invoke-static {v1, v3}, Lcom/android/server/PowerManagerService;->access$5902(Lcom/android/server/PowerManagerService;Z)Z

    .line 2963
    :cond_0
    :goto_0
    monitor-exit v2

    .line 2964
    return-void

    .line 2947
    :cond_1
    const-string v1, "android.intent.action.ACTION_QUICKBOOT_BOOT_COMPLETE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 2948
    iget-object v1, p0, Lcom/android/server/PowerManagerService$QuickbootBroadcastReceiver;->this$0:Lcom/android/server/PowerManagerService;

    #calls: Lcom/android/server/PowerManagerService;->forceUserActivityLocked()V
    invoke-static {v1}, Lcom/android/server/PowerManagerService;->access$1001(Lcom/android/server/PowerManagerService;)V

    .line 2949
    iget-object v1, p0, Lcom/android/server/PowerManagerService$QuickbootBroadcastReceiver;->this$0:Lcom/android/server/PowerManagerService;

    iget-object v3, p0, Lcom/android/server/PowerManagerService$QuickbootBroadcastReceiver;->this$0:Lcom/android/server/PowerManagerService;

    iget-boolean v3, v3, Lcom/android/server/PowerManagerService;->mAnimateScreenLightsOrigin:Z

    iput-boolean v3, v1, Lcom/android/server/PowerManagerService;->mAnimateScreenLights:Z

    goto :goto_0

    .line 2963
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 2950
    :cond_2
    :try_start_1
    const-string v1, "android.intent.action.ACTION_QUICKBOOT_BOOT"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 2951
    iget-object v1, p0, Lcom/android/server/PowerManagerService$QuickbootBroadcastReceiver;->this$0:Lcom/android/server/PowerManagerService;

    const/4 v3, 0x0

    #setter for: Lcom/android/server/PowerManagerService;->mIsQbShutdown:Z
    invoke-static {v1, v3}, Lcom/android/server/PowerManagerService;->access$5902(Lcom/android/server/PowerManagerService;Z)Z

    .line 2952
    iget-object v1, p0, Lcom/android/server/PowerManagerService$QuickbootBroadcastReceiver;->this$0:Lcom/android/server/PowerManagerService;

    #calls: Lcom/android/server/PowerManagerService;->forceUserActivityLocked()V
    invoke-static {v1}, Lcom/android/server/PowerManagerService;->access$1001(Lcom/android/server/PowerManagerService;)V

    goto :goto_0

    .line 2953
    :cond_3
    const-string v1, "android.intent.action.ACTION_QUICKBOOT_SCREENON"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 2954
    const-string v1, "PowerManagerService"

    const-string v3, "Turn on screen!!"

    invoke-static {v1, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2955
    const/4 v1, 0x1

    invoke-static {v1}, Landroid/os/Power;->setScreenState(Z)I

    .line 2956
    iget-object v1, p0, Lcom/android/server/PowerManagerService$QuickbootBroadcastReceiver;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mHandler:Landroid/os/Handler;
    invoke-static {v1}, Lcom/android/server/PowerManagerService;->access$5100(Lcom/android/server/PowerManagerService;)Landroid/os/Handler;

    move-result-object v1

    iget-object v3, p0, Lcom/android/server/PowerManagerService$QuickbootBroadcastReceiver;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mQbBrightnessTask:Ljava/lang/Runnable;
    invoke-static {v3}, Lcom/android/server/PowerManagerService;->access$6001(Lcom/android/server/PowerManagerService;)Ljava/lang/Runnable;

    move-result-object v3

    const-wide/16 v4, 0x1f4

    invoke-virtual {v1, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 2958
    :cond_4
    const-string v1, "android.intent.action.ACTION_QUICKBOOT_SCREENOFF"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2959
    const-string v1, "PowerManagerService"

    const-string v3, "Turn off screen!!"

    invoke-static {v1, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2960
    const/4 v1, 0x0

    invoke-static {v1}, Landroid/os/Power;->setScreenState(Z)I

    .line 2961
    iget-object v1, p0, Lcom/android/server/PowerManagerService$QuickbootBroadcastReceiver;->this$0:Lcom/android/server/PowerManagerService;

    #getter for: Lcom/android/server/PowerManagerService;->mScreenBrightness:Lcom/android/server/PowerManagerService$BrightnessState;
    invoke-static {v1}, Lcom/android/server/PowerManagerService;->access$6000(Lcom/android/server/PowerManagerService;)Lcom/android/server/PowerManagerService$BrightnessState;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lcom/android/server/PowerManagerService$BrightnessState;->forceValueLocked(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method