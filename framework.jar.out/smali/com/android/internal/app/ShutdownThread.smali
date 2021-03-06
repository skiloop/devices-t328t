.class public final Lcom/android/internal/app/ShutdownThread;
.super Ljava/lang/Thread;
.source "ShutdownThread.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/app/ShutdownThread$CloseDialogReceiver;
    }
.end annotation


# static fields
.field private static final ACTION_QUICKBOOT_SHUTDOWN:Ljava/lang/String; = "android.intent.action.ACTION_QUICKBOOT_SHUTDOWN"

.field private static final MAX_BROADCAST_TIME:I = 0x2710

.field private static final MAX_NUM_PHONE_STATE_READS:I = 0x10

.field private static final MAX_SHUTDOWN_WAIT_TIME:I = 0x4e20

.field private static final PHONE_STATE_POLL_SLEEP_MSEC:I = 0x1f4

.field public static final SHUTDOWN_ACTION_PROPERTY:Ljava/lang/String; = "sys.shutdown.requested"

.field private static final SHUTDOWN_VIBRATE_MS:I = 0x1f4

.field private static final TAG:Ljava/lang/String; = "ShutdownThread"

.field private static mIsQbChecked:Z

.field private static mIsQuickbootShutdown:Z

.field private static final mQbManager:Lcom/android/internal/app/QuickbootManager;

.field private static mReboot:Z

.field private static mRebootReason:Ljava/lang/String;

.field private static mShutdownProgressDialog:Landroid/app/ProgressDialog;

.field private static mShutdownThreadSync:Ljava/lang/Object;

.field private static final sInstance:Lcom/android/internal/app/ShutdownThread;

.field private static sIsStarted:Z

.field private static sIsStartedGuard:Ljava/lang/Object;


# instance fields
.field private mActionDone:Z

.field private final mActionDoneSync:Ljava/lang/Object;

.field private mContext:Landroid/content/Context;

.field private mCpuWakeLock:Landroid/os/PowerManager$WakeLock;

.field private mHandler:Landroid/os/Handler;

.field private mPowerManager:Landroid/os/PowerManager;

.field private mScreenWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 66
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/internal/app/ShutdownThread;->sIsStartedGuard:Ljava/lang/Object;

    .line 67
    sput-boolean v1, Lcom/android/internal/app/ShutdownThread;->sIsStarted:Z

    .line 76
    new-instance v0, Lcom/android/internal/app/ShutdownThread;

    invoke-direct {v0}, Lcom/android/internal/app/ShutdownThread;-><init>()V

    sput-object v0, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    .line 88
    sput-boolean v1, Lcom/android/internal/app/ShutdownThread;->mIsQuickbootShutdown:Z

    .line 89
    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/internal/app/ShutdownThread;->mIsQbChecked:Z

    .line 91
    invoke-static {}, Lcom/android/internal/app/QuickbootManager;->getInstance()Lcom/android/internal/app/QuickbootManager;

    move-result-object v0

    sput-object v0, Lcom/android/internal/app/ShutdownThread;->mQbManager:Lcom/android/internal/app/QuickbootManager;

    .line 93
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/internal/app/ShutdownThread;->mShutdownThreadSync:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 96
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 78
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/internal/app/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    .line 97
    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 53
    invoke-static {p0}, Lcom/android/internal/app/ShutdownThread;->beginShutdownSequence(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$102(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 53
    sput-boolean p0, Lcom/android/internal/app/ShutdownThread;->mReboot:Z

    return p0
.end method

.method static synthetic access$102(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"

    .prologue
    .line 53
    sput-object p0, Lcom/android/internal/app/ShutdownThread;->mRebootReason:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200()Z
    .locals 1

    .prologue
    .line 53
    sget-boolean v0, Lcom/android/internal/app/ShutdownThread;->mIsQbChecked:Z

    return v0
.end method

.method static synthetic access$202(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 53
    sput-boolean p0, Lcom/android/internal/app/ShutdownThread;->mIsQbChecked:Z

    return p0
.end method

.method static synthetic access$302(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 53
    sput-boolean p0, Lcom/android/internal/app/ShutdownThread;->mIsQuickbootShutdown:Z

    return p0
.end method

.method private static beginShutdownSequence(Landroid/content/Context;)V
    .locals 6
    .parameter "context"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v5, 0x0

    .line 212
    sget-object v2, Lcom/android/internal/app/ShutdownThread;->sIsStartedGuard:Ljava/lang/Object;

    monitor-enter v2

    .line 213
    :try_start_0
    sget-boolean v1, Lcom/android/internal/app/ShutdownThread;->sIsStarted:Z

    if-eqz v1, :cond_0

    .line 214
    const-string v1, "ShutdownThread"

    const-string v3, "Shutdown sequence already running, returning."

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    monitor-exit v2

    .line 273
    :goto_0
    return-void

    .line 217
    :cond_0
    const/4 v1, 0x1

    sput-boolean v1, Lcom/android/internal/app/ShutdownThread;->sIsStarted:Z

    .line 218
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 223
    new-instance v1, Landroid/app/ProgressDialog;

    invoke-direct {v1, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/android/internal/app/ShutdownThread;->mShutdownProgressDialog:Landroid/app/ProgressDialog;

    .line 224
    sget-boolean v1, Lcom/android/internal/app/ShutdownThread;->mReboot:Z

    if-nez v1, :cond_2

    .line 225
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->mShutdownProgressDialog:Landroid/app/ProgressDialog;

    const v2, #string@power_off#t

    invoke-virtual {p0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 226
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->mShutdownProgressDialog:Landroid/app/ProgressDialog;

    const v2, #string@shutdown_progress#t

    invoke-virtual {p0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 231
    :goto_1
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->mShutdownProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1, v4}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 232
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->mShutdownProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 233
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->mShutdownProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x7d9

    invoke-virtual {v1, v2}, Landroid/view/Window;->setType(I)V

    .line 235
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->mShutdownProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    .line 238
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    iput-object p0, v1, Lcom/android/internal/app/ShutdownThread;->mContext:Landroid/content/Context;

    .line 239
    sget-object v2, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    const-string/jumbo v1, "power"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    iput-object v1, v2, Lcom/android/internal/app/ShutdownThread;->mPowerManager:Landroid/os/PowerManager;

    .line 242
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    iput-object v5, v1, Lcom/android/internal/app/ShutdownThread;->mCpuWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 244
    :try_start_1
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    sget-object v2, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    iget-object v2, v2, Lcom/android/internal/app/ShutdownThread;->mPowerManager:Landroid/os/PowerManager;

    const/4 v3, 0x1

    const-string v4, "ShutdownThread-cpu"

    invoke-virtual {v2, v3, v4}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/app/ShutdownThread;->mCpuWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 246
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    iget-object v1, v1, Lcom/android/internal/app/ShutdownThread;->mCpuWakeLock:Landroid/os/PowerManager$WakeLock;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 247
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    iget-object v1, v1, Lcom/android/internal/app/ShutdownThread;->mCpuWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0

    .line 254
    :goto_2
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    iput-object v5, v1, Lcom/android/internal/app/ShutdownThread;->mScreenWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 255
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    iget-object v1, v1, Lcom/android/internal/app/ShutdownThread;->mPowerManager:Landroid/os/PowerManager;

    invoke-virtual {v1}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 257
    :try_start_2
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    sget-object v2, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    iget-object v2, v2, Lcom/android/internal/app/ShutdownThread;->mPowerManager:Landroid/os/PowerManager;

    const/16 v3, 0x1a

    const-string v4, "ShutdownThread-screen"

    invoke-virtual {v2, v3, v4}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/app/ShutdownThread;->mScreenWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 259
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    iget-object v1, v1, Lcom/android/internal/app/ShutdownThread;->mScreenWakeLock:Landroid/os/PowerManager$WakeLock;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 260
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    iget-object v1, v1, Lcom/android/internal/app/ShutdownThread;->mScreenWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_1

    .line 268
    :cond_1
    :goto_3
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    new-instance v2, Lcom/android/internal/app/ShutdownThread$4;

    invoke-direct {v2}, Lcom/android/internal/app/ShutdownThread$4;-><init>()V

    iput-object v2, v1, Lcom/android/internal/app/ShutdownThread;->mHandler:Landroid/os/Handler;

    .line 271
    invoke-static {}, Lcom/android/internal/app/ShutdownThread;->startThread()V

    goto/16 :goto_0

    .line 218
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1

    .line 228
    :cond_2
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->mShutdownProgressDialog:Landroid/app/ProgressDialog;

    const v2, #string@reboot#t

    invoke-virtual {p0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 229
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->mShutdownProgressDialog:Landroid/app/ProgressDialog;

    const v2, #string@reboot_progress#t

    invoke-virtual {p0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 248
    :catch_0
    move-exception v0

    .line 249
    .local v0, e:Ljava/lang/SecurityException;
    const-string v1, "ShutdownThread"

    const-string v2, "No permission to acquire wake lock"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 250
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    iput-object v5, v1, Lcom/android/internal/app/ShutdownThread;->mCpuWakeLock:Landroid/os/PowerManager$WakeLock;

    goto :goto_2

    .line 261
    .end local v0           #e:Ljava/lang/SecurityException;
    :catch_1
    move-exception v0

    .line 262
    .restart local v0       #e:Ljava/lang/SecurityException;
    const-string v1, "ShutdownThread"

    const-string v2, "No permission to acquire wake lock"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 263
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    iput-object v5, v1, Lcom/android/internal/app/ShutdownThread;->mScreenWakeLock:Landroid/os/PowerManager$WakeLock;

    goto :goto_3
.end method

.method private static checkShutdownFlow()V
    .locals 1

    .prologue
    .line 362
    sget-boolean v0, Lcom/android/internal/app/ShutdownThread;->mIsQuickbootShutdown:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/internal/app/ShutdownThread;->mQbManager:Lcom/android/internal/app/QuickbootManager;

    invoke-virtual {v0}, Lcom/android/internal/app/QuickbootManager;->isQbAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/android/internal/app/ShutdownThread;->mIsQuickbootShutdown:Z

    .line 363
    return-void

    .line 362
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static createQbShutdownConfirmDialog(Landroid/content/Context;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 10
    .parameter "context"
    .parameter "origin"

    .prologue
    const/4 v3, 0x0

    .line 299
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, #bool@config_quickbootSupport#t

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getBoolean(I)Z
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v8

    .line 301
    .local v8, quickbootSupport:Z
    if-nez v8, :cond_0

    .line 347
    .end local v8           #quickbootSupport:Z
    .end local p1
    :goto_0
    return-object p1

    .line 303
    .restart local p1
    :catch_0
    move-exception v7

    .line 304
    .local v7, e:Landroid/content/res/Resources$NotFoundException;
    goto :goto_0

    .line 307
    .end local v7           #e:Landroid/content/res/Resources$NotFoundException;
    .restart local v8       #quickbootSupport:Z
    :cond_0
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, #string@power_off#t

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v4, #string@quickboot_shutdown_info#t

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v4, #string@yes#t

    new-instance v5, Lcom/android/internal/app/ShutdownThread$5;

    invoke-direct {v5, p0}, Lcom/android/internal/app/ShutdownThread$5;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v4, #string@no#t

    const/4 v5, 0x0

    invoke-virtual {v2, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 317
    .local v0, ret:Landroid/app/AlertDialog;
    new-instance v6, Landroid/widget/CheckBox;

    invoke-direct {v6, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 318
    .local v6, checkBox:Landroid/widget/CheckBox;
    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 319
    .local v9, text:Landroid/widget/TextView;
    const v2, #string@power_off_alarm#t

    invoke-virtual {v9, v2}, Landroid/widget/TextView;->setText(I)V

    .line 320
    const/16 v2, 0xa

    invoke-virtual {v9, v2, v3, v3, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 321
    const/high16 v2, 0x4140

    invoke-virtual {v9, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 322
    sget-boolean v2, Lcom/android/internal/app/ShutdownThread;->mIsQbChecked:Z

    invoke-virtual {v6, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 323
    sget-boolean v2, Lcom/android/internal/app/ShutdownThread;->mIsQbChecked:Z

    sput-boolean v2, Lcom/android/internal/app/ShutdownThread;->mIsQuickbootShutdown:Z

    .line 324
    invoke-virtual {v6}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 325
    const v2, -0xaba8a1

    invoke-virtual {v9, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 329
    :goto_1
    new-instance v2, Lcom/android/internal/app/ShutdownThread$6;

    invoke-direct {v2, v9}, Lcom/android/internal/app/ShutdownThread$6;-><init>(Landroid/widget/TextView;)V

    invoke-virtual {v6, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 341
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 342
    .local v1, layout:Landroid/widget/LinearLayout;
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 343
    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 344
    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 346
    const/16 v2, 0xe

    const/16 v5, 0x14

    move v4, v3

    invoke-virtual/range {v0 .. v5}, Landroid/app/AlertDialog;->setView(Landroid/view/View;IIII)V

    move-object p1, v0

    .line 347
    goto :goto_0

    .line 327
    .end local v1           #layout:Landroid/widget/LinearLayout;
    :cond_1
    const v2, -0x4d4c48

    invoke-virtual {v9, v2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_1
.end method

.method public static dismissDialog()V
    .locals 1

    .prologue
    .line 351
    sget-object v0, Lcom/android/internal/app/ShutdownThread;->mShutdownProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 352
    sget-object v0, Lcom/android/internal/app/ShutdownThread;->mShutdownProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 353
    const/4 v0, 0x0

    sput-object v0, Lcom/android/internal/app/ShutdownThread;->mShutdownProgressDialog:Landroid/app/ProgressDialog;

    .line 355
    :cond_0
    return-void
.end method

.method public static reboot(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 1
    .parameter "context"
    .parameter "reason"
    .parameter "confirm"

    .prologue
    .line 206
    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/internal/app/ShutdownThread;->mReboot:Z

    .line 207
    sput-object p1, Lcom/android/internal/app/ShutdownThread;->mRebootReason:Ljava/lang/String;

    .line 208
    invoke-static {p0, p2}, Lcom/android/internal/app/ShutdownThread;->shutdown(Landroid/content/Context;Z)V

    .line 209
    return-void
.end method

.method public static rebootOrShutdown(ZLjava/lang/String;)V
    .locals 5
    .parameter "reboot"
    .parameter "reason"

    .prologue
    .line 789
    if-eqz p0, :cond_0

    .line 790
    const-string v2, "ShutdownThread"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Rebooting, reason: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 792
    :try_start_0
    invoke-static {p1}, Landroid/os/Power;->reboot(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 814
    :goto_0
    const-string v2, "ShutdownThread"

    const-string v3, "Performing low-level shutdown..."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 815
    invoke-static {}, Landroid/os/Power;->shutdown()V

    .line 816
    return-void

    .line 793
    :catch_0
    move-exception v0

    .line 794
    .local v0, e:Ljava/lang/Exception;
    const-string v2, "ShutdownThread"

    const-string v3, "Reboot failed, will attempt shutdown instead"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 798
    .end local v0           #e:Ljava/lang/Exception;
    :cond_0
    new-instance v1, Landroid/os/Vibrator;

    invoke-direct {v1}, Landroid/os/Vibrator;-><init>()V

    .line 800
    .local v1, vibrator:Landroid/os/Vibrator;
    const-wide/16 v2, 0x1f4

    :try_start_1
    invoke-virtual {v1, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 808
    :goto_1
    const-wide/16 v2, 0x1f4

    :try_start_2
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 809
    :catch_1
    move-exception v2

    goto :goto_0

    .line 801
    :catch_2
    move-exception v0

    .line 803
    .restart local v0       #e:Ljava/lang/Exception;
    const-string v2, "ShutdownThread"

    const-string v3, "Failed to vibrate during shutdown."

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method public static shutdown(Landroid/content/Context;Z)V
    .locals 1
    .parameter "context"
    .parameter "confirm"

    .prologue
    .line 109
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/internal/app/ShutdownThread;->mIsQuickbootShutdown:Z

    .line 111
    invoke-static {p0, p1}, Lcom/android/internal/app/ShutdownThread;->shutdownInner(Landroid/content/Context;Z)V

    .line 112
    return-void
.end method

.method public static shutdownFromPoweroffAlarm(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 292
    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/internal/app/ShutdownThread;->mIsQuickbootShutdown:Z

    .line 293
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/android/internal/app/ShutdownThread;->shutdownInner(Landroid/content/Context;Z)V

    .line 294
    return-void
.end method

.method static shutdownInner(Landroid/content/Context;Z)V
    .locals 10
    .parameter "context"
    .parameter "confirm"

    .prologue
    const v9, #string@yes#t

    const v8, #string@no#t

    .line 117
    sget-object v5, Lcom/android/internal/app/ShutdownThread;->sIsStartedGuard:Ljava/lang/Object;

    monitor-enter v5

    .line 118
    :try_start_0
    sget-boolean v4, Lcom/android/internal/app/ShutdownThread;->sIsStarted:Z

    if-eqz v4, :cond_0

    .line 119
    const-string v4, "ShutdownThread"

    const-string v6, "Request to shutdown already running, returning."

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    monitor-exit v5

    .line 185
    :goto_0
    return-void

    .line 122
    :cond_0
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 124
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, #integer@config_longPressOnPowerBehavior#t

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    .line 126
    .local v2, longPressBehavior:I
    const/4 v4, 0x2

    if-ne v2, v4, :cond_1

    const v3, #string@shutdown_confirm_question#t

    .line 130
    .local v3, resourceId:I
    :goto_1
    const-string v4, "ShutdownThread"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Notifying thread to start shutdown longPressBehavior="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    if-eqz p1, :cond_3

    .line 133
    new-instance v0, Lcom/android/internal/app/ShutdownThread$CloseDialogReceiver;

    invoke-direct {v0, p0}, Lcom/android/internal/app/ShutdownThread$CloseDialogReceiver;-><init>(Landroid/content/Context;)V

    .line 135
    .local v0, closer:Lcom/android/internal/app/ShutdownThread$CloseDialogReceiver;
    sget-boolean v4, Lcom/android/internal/app/ShutdownThread;->mReboot:Z

    if-nez v4, :cond_2

    .line 136
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-direct {v4, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v5, #string@power_off#t

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    new-instance v5, Lcom/android/internal/app/ShutdownThread$1;

    invoke-direct {v5, p0}, Lcom/android/internal/app/ShutdownThread$1;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v9, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v8, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 147
    .local v1, dialog:Landroid/app/AlertDialog;
    invoke-static {p0, v1}, Lcom/android/internal/app/ShutdownThread;->createQbShutdownConfirmDialog(Landroid/content/Context;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    move-result-object v1

    .line 178
    :goto_2
    iput-object v1, v0, Lcom/android/internal/app/ShutdownThread$CloseDialogReceiver;->dialog:Landroid/app/Dialog;

    .line 179
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 180
    invoke-virtual {v1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    const/16 v5, 0x7d9

    invoke-virtual {v4, v5}, Landroid/view/Window;->setType(I)V

    .line 181
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .line 122
    .end local v0           #closer:Lcom/android/internal/app/ShutdownThread$CloseDialogReceiver;
    .end local v1           #dialog:Landroid/app/AlertDialog;
    .end local v2           #longPressBehavior:I
    .end local v3           #resourceId:I
    :catchall_0
    move-exception v4

    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4

    .line 126
    .restart local v2       #longPressBehavior:I
    :cond_1
    const v3, #string@shutdown_confirm#t

    goto :goto_1

    .line 150
    .restart local v0       #closer:Lcom/android/internal/app/ShutdownThread$CloseDialogReceiver;
    .restart local v3       #resourceId:I
    :cond_2
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-direct {v4, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v5, #drawable@ic_dialog_alert#t

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, #string@reboot#t

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, #array@shutdown_reboot_options#t

    const/4 v6, 0x0

    new-instance v7, Lcom/android/internal/app/ShutdownThread$11;

    invoke-direct {v7, p0}, Lcom/android/internal/app/ShutdownThread$11;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(IILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    new-instance v5, Lcom/android/internal/app/ShutdownThread$3;

    invoke-direct {v5, p0}, Lcom/android/internal/app/ShutdownThread$3;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v9, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    new-instance v5, Lcom/android/internal/app/ShutdownThread$2;

    invoke-direct {v5}, Lcom/android/internal/app/ShutdownThread$2;-><init>()V

    invoke-virtual {v4, v8, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .restart local v1       #dialog:Landroid/app/AlertDialog;
    goto :goto_2

    .line 183
    .end local v0           #closer:Lcom/android/internal/app/ShutdownThread$CloseDialogReceiver;
    .end local v1           #dialog:Landroid/app/AlertDialog;
    :cond_3
    invoke-static {p0}, Lcom/android/internal/app/ShutdownThread;->beginShutdownSequence(Landroid/content/Context;)V

    goto/16 :goto_0
.end method

.method private static startThread()V
    .locals 2

    .prologue
    .line 277
    sget-object v0, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    invoke-virtual {v0}, Lcom/android/internal/app/ShutdownThread;->getState()Ljava/lang/Thread$State;

    move-result-object v0

    sget-object v1, Ljava/lang/Thread$State;->NEW:Ljava/lang/Thread$State;

    if-ne v0, v1, :cond_0

    sget-object v0, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    invoke-virtual {v0}, Lcom/android/internal/app/ShutdownThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 278
    :cond_0
    invoke-static {}, Lcom/android/internal/app/ShutdownThread;->checkShutdownFlow()V

    .line 279
    sget-object v1, Lcom/android/internal/app/ShutdownThread;->mShutdownThreadSync:Ljava/lang/Object;

    monitor-enter v1

    .line 280
    :try_start_0
    sget-object v0, Lcom/android/internal/app/ShutdownThread;->mShutdownThreadSync:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 281
    monitor-exit v1

    .line 285
    :goto_0
    return-void

    .line 281
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 283
    :cond_1
    sget-object v0, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    invoke-virtual {v0}, Lcom/android/internal/app/ShutdownThread;->start()V

    goto :goto_0
.end method


# virtual methods
.method actionDone()V
    .locals 2

    .prologue
    .line 367
    iget-object v1, p0, Lcom/android/internal/app/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    monitor-enter v1

    .line 368
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/android/internal/app/ShutdownThread;->mActionDone:Z

    .line 369
    iget-object v0, p0, Lcom/android/internal/app/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 370
    monitor-exit v1

    .line 371
    return-void

    .line 370
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public normalShutdown()V
    .locals 27

    .prologue
    .line 632
    new-instance v5, Lcom/android/internal/app/ShutdownThread$9;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/android/internal/app/ShutdownThread$9;-><init>(Lcom/android/internal/app/ShutdownThread;)V

    .line 645
    .local v5, br:Landroid/content/BroadcastReceiver;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-boolean v2, Lcom/android/internal/app/ShutdownThread;->mReboot:Z

    if-eqz v2, :cond_a

    const-string v2, "1"

    :goto_0
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v2, Lcom/android/internal/app/ShutdownThread;->mRebootReason:Ljava/lang/String;

    if-eqz v2, :cond_b

    sget-object v2, Lcom/android/internal/app/ShutdownThread;->mRebootReason:Ljava/lang/String;

    :goto_1
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    .line 646
    .local v26, reason:Ljava/lang/String;
    const-string/jumbo v2, "sys.shutdown.requested"

    move-object/from16 v0, v26

    invoke-static {v2, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 649
    const-string v2, "ShutdownThread"

    const-string v3, "Sending shutdown broadcast..."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 652
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/android/internal/app/ShutdownThread;->mActionDone:Z

    .line 653
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/app/ShutdownThread;->mContext:Landroid/content/Context;

    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.ACTION_SHUTDOWN"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/internal/app/ShutdownThread;->mHandler:Landroid/os/Handler;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/content/Context;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;Landroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V

    .line 656
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    const-wide/16 v6, 0x2710

    add-long v18, v2, v6

    .line 657
    .local v18, endTime:J
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/app/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    monitor-enter v3

    .line 658
    :goto_2
    :try_start_0
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/internal/app/ShutdownThread;->mActionDone:Z

    if-nez v2, :cond_0

    .line 659
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sub-long v13, v18, v6

    .line 660
    .local v13, delay:J
    const-wide/16 v6, 0x0

    cmp-long v2, v13, v6

    if-gtz v2, :cond_c

    .line 661
    const-string v2, "ShutdownThread"

    const-string v4, "Shutdown broadcast timed out"

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 669
    .end local v13           #delay:J
    :cond_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 671
    const-string v2, "ShutdownThread"

    const-string v3, "Shutting down activity manager..."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 673
    const-string v2, "activity"

    invoke-static {v2}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/app/ActivityManagerNative;->asInterface(Landroid/os/IBinder;)Landroid/app/IActivityManager;

    move-result-object v10

    .line 675
    .local v10, am:Landroid/app/IActivityManager;
    if-eqz v10, :cond_1

    .line 677
    const/16 v2, 0x2710

    :try_start_1
    invoke-interface {v10, v2}, Landroid/app/IActivityManager;->shutdown(I)Z
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_7

    .line 682
    :cond_1
    :goto_3
    const-string/jumbo v2, "phone"

    invoke-static {v2}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v24

    .line 684
    .local v24, phone:Lcom/android/internal/telephony/ITelephony;
    const-string v2, "bluetooth"

    invoke-static {v2}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/bluetooth/IBluetooth$Stub;->asInterface(Landroid/os/IBinder;)Landroid/bluetooth/IBluetooth;

    move-result-object v11

    .line 688
    .local v11, bluetooth:Landroid/bluetooth/IBluetooth;
    const-string/jumbo v2, "mount"

    invoke-static {v2}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/os/storage/IMountService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/storage/IMountService;

    move-result-object v22

    .line 693
    .local v22, mount:Landroid/os/storage/IMountService;
    if-eqz v11, :cond_2

    :try_start_2
    invoke-interface {v11}, Landroid/bluetooth/IBluetooth;->getBluetoothState()I

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_d

    :cond_2
    const/4 v12, 0x1

    .line 695
    .local v12, bluetoothOff:Z
    :goto_4
    if-nez v12, :cond_3

    .line 696
    const-string v2, "ShutdownThread"

    const-string v3, "Disabling Bluetooth..."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 697
    const/4 v2, 0x0

    invoke-interface {v11, v2}, Landroid/bluetooth/IBluetooth;->disable(Z)Z
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1

    .line 705
    :cond_3
    :goto_5
    if-eqz v24, :cond_4

    :try_start_3
    invoke-interface/range {v24 .. v24}, Lcom/android/internal/telephony/ITelephony;->isRadioOn()Z

    move-result v2

    if-nez v2, :cond_e

    :cond_4
    const/16 v25, 0x1

    .line 706
    .local v25, radioOff:Z
    :goto_6
    if-nez v25, :cond_5

    .line 707
    const-string v2, "ShutdownThread"

    const-string v3, "Turning off radio..."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 708
    const/4 v2, 0x0

    move-object/from16 v0, v24

    invoke-interface {v0, v2}, Lcom/android/internal/telephony/ITelephony;->setRadio(Z)Z
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_2

    .line 715
    :cond_5
    :goto_7
    const-string v2, "ShutdownThread"

    const-string v3, "Waiting for Bluetooth and Radio..."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 718
    const/16 v21, 0x0

    .local v21, i:I
    :goto_8
    const/16 v2, 0x10

    move/from16 v0, v21

    if-ge v0, v2, :cond_8

    .line 719
    if-nez v12, :cond_6

    .line 721
    :try_start_4
    invoke-interface {v11}, Landroid/bluetooth/IBluetooth;->getBluetoothState()I
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_3

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_f

    const/4 v12, 0x1

    .line 728
    :cond_6
    :goto_9
    if-nez v25, :cond_7

    .line 730
    :try_start_5
    invoke-interface/range {v24 .. v24}, Lcom/android/internal/telephony/ITelephony;->isRadioOn()Z
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_4

    move-result v2

    if-nez v2, :cond_10

    const/16 v25, 0x1

    .line 736
    :cond_7
    :goto_a
    if-eqz v25, :cond_11

    if-eqz v12, :cond_11

    .line 737
    const-string v2, "ShutdownThread"

    const-string v3, "Radio and Bluetooth shutdown complete."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 744
    :cond_8
    new-instance v23, Lcom/android/internal/app/ShutdownThread$10;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/android/internal/app/ShutdownThread$10;-><init>(Lcom/android/internal/app/ShutdownThread;)V

    .line 751
    .local v23, observer:Landroid/os/storage/IMountShutdownObserver;
    const-string v2, "ShutdownThread"

    const-string v3, "Shutting down MountService"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 753
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/android/internal/app/ShutdownThread;->mActionDone:Z

    .line 754
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    const-wide/16 v6, 0x4e20

    add-long v16, v2, v6

    .line 755
    .local v16, endShutTime:J
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/app/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    monitor-enter v3

    .line 757
    if-eqz v22, :cond_12

    .line 758
    :try_start_6
    invoke-interface/range {v22 .. v23}, Landroid/os/storage/IMountService;->shutdown(Landroid/os/storage/IMountShutdownObserver;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    .line 765
    :goto_b
    :try_start_7
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/internal/app/ShutdownThread;->mActionDone:Z

    if-nez v2, :cond_9

    .line 766
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sub-long v13, v16, v6

    .line 767
    .restart local v13       #delay:J
    const-wide/16 v6, 0x0

    cmp-long v2, v13, v6

    if-gtz v2, :cond_13

    .line 768
    const-string v2, "ShutdownThread"

    const-string v4, "Shutdown wait timed out"

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 776
    .end local v13           #delay:J
    :cond_9
    monitor-exit v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 778
    sget-boolean v2, Lcom/android/internal/app/ShutdownThread;->mReboot:Z

    sget-object v3, Lcom/android/internal/app/ShutdownThread;->mRebootReason:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/android/internal/app/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    .line 779
    return-void

    .line 645
    .end local v10           #am:Landroid/app/IActivityManager;
    .end local v11           #bluetooth:Landroid/bluetooth/IBluetooth;
    .end local v12           #bluetoothOff:Z
    .end local v16           #endShutTime:J
    .end local v18           #endTime:J
    .end local v21           #i:I
    .end local v22           #mount:Landroid/os/storage/IMountService;
    .end local v23           #observer:Landroid/os/storage/IMountShutdownObserver;
    .end local v24           #phone:Lcom/android/internal/telephony/ITelephony;
    .end local v25           #radioOff:Z
    .end local v26           #reason:Ljava/lang/String;
    :cond_a
    const-string v2, "0"

    goto/16 :goto_0

    :cond_b
    const-string v2, ""

    goto/16 :goto_1

    .line 665
    .restart local v13       #delay:J
    .restart local v18       #endTime:J
    .restart local v26       #reason:Ljava/lang/String;
    :cond_c
    :try_start_8
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/app/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    invoke-virtual {v2, v13, v14}, Ljava/lang/Object;->wait(J)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_8} :catch_0

    goto/16 :goto_2

    .line 666
    :catch_0
    move-exception v2

    goto/16 :goto_2

    .line 669
    .end local v13           #delay:J
    :catchall_0
    move-exception v2

    :try_start_9
    monitor-exit v3
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    throw v2

    .line 693
    .restart local v10       #am:Landroid/app/IActivityManager;
    .restart local v11       #bluetooth:Landroid/bluetooth/IBluetooth;
    .restart local v22       #mount:Landroid/os/storage/IMountService;
    .restart local v24       #phone:Lcom/android/internal/telephony/ITelephony;
    :cond_d
    const/4 v12, 0x0

    goto/16 :goto_4

    .line 699
    :catch_1
    move-exception v20

    .line 700
    .local v20, ex:Landroid/os/RemoteException;
    const-string v2, "ShutdownThread"

    const-string v3, "RemoteException during bluetooth shutdown"

    move-object/from16 v0, v20

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 701
    const/4 v12, 0x1

    .restart local v12       #bluetoothOff:Z
    goto/16 :goto_5

    .line 705
    .end local v20           #ex:Landroid/os/RemoteException;
    :cond_e
    const/16 v25, 0x0

    goto/16 :goto_6

    .line 710
    :catch_2
    move-exception v20

    .line 711
    .restart local v20       #ex:Landroid/os/RemoteException;
    const-string v2, "ShutdownThread"

    const-string v3, "RemoteException during radio shutdown"

    move-object/from16 v0, v20

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 712
    const/16 v25, 0x1

    .restart local v25       #radioOff:Z
    goto/16 :goto_7

    .line 721
    .end local v20           #ex:Landroid/os/RemoteException;
    .restart local v21       #i:I
    :cond_f
    const/4 v12, 0x0

    goto/16 :goto_9

    .line 723
    :catch_3
    move-exception v20

    .line 724
    .restart local v20       #ex:Landroid/os/RemoteException;
    const-string v2, "ShutdownThread"

    const-string v3, "RemoteException during bluetooth shutdown"

    move-object/from16 v0, v20

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 725
    const/4 v12, 0x1

    goto/16 :goto_9

    .line 730
    .end local v20           #ex:Landroid/os/RemoteException;
    :cond_10
    const/16 v25, 0x0

    goto/16 :goto_a

    .line 731
    :catch_4
    move-exception v20

    .line 732
    .restart local v20       #ex:Landroid/os/RemoteException;
    const-string v2, "ShutdownThread"

    const-string v3, "RemoteException during radio shutdown"

    move-object/from16 v0, v20

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 733
    const/16 v25, 0x1

    goto/16 :goto_a

    .line 740
    .end local v20           #ex:Landroid/os/RemoteException;
    :cond_11
    const-wide/16 v2, 0x1f4

    invoke-static {v2, v3}, Landroid/os/SystemClock;->sleep(J)V

    .line 718
    add-int/lit8 v21, v21, 0x1

    goto/16 :goto_8

    .line 760
    .restart local v16       #endShutTime:J
    .restart local v23       #observer:Landroid/os/storage/IMountShutdownObserver;
    :cond_12
    :try_start_a
    const-string v2, "ShutdownThread"

    const-string v4, "MountService unavailable for shutdown"

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_5

    goto/16 :goto_b

    .line 762
    :catch_5
    move-exception v15

    .line 763
    .local v15, e:Ljava/lang/Exception;
    :try_start_b
    const-string v2, "ShutdownThread"

    const-string v4, "Exception during MountService shutdown"

    invoke-static {v2, v4, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_b

    .line 776
    .end local v15           #e:Ljava/lang/Exception;
    :catchall_1
    move-exception v2

    monitor-exit v3
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    throw v2

    .line 772
    .restart local v13       #delay:J
    :cond_13
    :try_start_c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/app/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    invoke-virtual {v2, v13, v14}, Ljava/lang/Object;->wait(J)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1
    .catch Ljava/lang/InterruptedException; {:try_start_c .. :try_end_c} :catch_6

    goto/16 :goto_b

    .line 773
    :catch_6
    move-exception v2

    goto/16 :goto_b

    .line 678
    .end local v11           #bluetooth:Landroid/bluetooth/IBluetooth;
    .end local v12           #bluetoothOff:Z
    .end local v13           #delay:J
    .end local v16           #endShutTime:J
    .end local v21           #i:I
    .end local v22           #mount:Landroid/os/storage/IMountService;
    .end local v23           #observer:Landroid/os/storage/IMountShutdownObserver;
    .end local v24           #phone:Lcom/android/internal/telephony/ITelephony;
    .end local v25           #radioOff:Z
    :catch_7
    move-exception v2

    goto/16 :goto_3
.end method

.method public quickbootShutdown()V
    .locals 31

    .prologue
    .line 398
    sget-object v2, Lcom/android/internal/app/ShutdownThread;->mQbManager:Lcom/android/internal/app/QuickbootManager;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/app/ShutdownThread;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/android/internal/app/QuickbootManager;->saveSystemStates(Landroid/content/Context;)V

    .line 402
    new-instance v5, Lcom/android/internal/app/ShutdownThread$7;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/android/internal/app/ShutdownThread$7;-><init>(Lcom/android/internal/app/ShutdownThread;)V

    .line 415
    .local v5, br:Landroid/content/BroadcastReceiver;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-boolean v2, Lcom/android/internal/app/ShutdownThread;->mReboot:Z

    if-eqz v2, :cond_d

    const-string v2, "1"

    :goto_0
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v2, Lcom/android/internal/app/ShutdownThread;->mRebootReason:Ljava/lang/String;

    if-eqz v2, :cond_e

    sget-object v2, Lcom/android/internal/app/ShutdownThread;->mRebootReason:Ljava/lang/String;

    :goto_1
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    .line 416
    .local v28, reason:Ljava/lang/String;
    const-string/jumbo v2, "sys.shutdown.requested"

    move-object/from16 v0, v28

    invoke-static {v2, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 419
    const-string v2, "ShutdownThread"

    const-string v3, "Sending shutdown broadcast..."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 422
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/android/internal/app/ShutdownThread;->mActionDone:Z

    .line 423
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/app/ShutdownThread;->mContext:Landroid/content/Context;

    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.ACTION_QUICKBOOT_SHUTDOWN"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/internal/app/ShutdownThread;->mHandler:Landroid/os/Handler;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/content/Context;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;Landroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V

    .line 426
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    const-wide/16 v6, 0x2710

    add-long v20, v2, v6

    .line 427
    .local v20, endTimeQb:J
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/app/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    monitor-enter v3

    .line 428
    :goto_2
    :try_start_0
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/internal/app/ShutdownThread;->mActionDone:Z

    if-nez v2, :cond_0

    .line 429
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sub-long v13, v20, v6

    .line 430
    .local v13, delay:J
    const-wide/16 v6, 0x0

    cmp-long v2, v13, v6

    if-gtz v2, :cond_f

    .line 431
    const-string v2, "ShutdownThread"

    const-string v4, "Quickboot shutdown broadcast timed out. Enter normal shutdown"

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 432
    const/4 v2, 0x0

    sput-boolean v2, Lcom/android/internal/app/ShutdownThread;->mIsQuickbootShutdown:Z

    .line 440
    .end local v13           #delay:J
    :cond_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 443
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/android/internal/app/ShutdownThread;->mActionDone:Z

    .line 444
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/app/ShutdownThread;->mContext:Landroid/content/Context;

    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.ACTION_SHUTDOWN"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/internal/app/ShutdownThread;->mHandler:Landroid/os/Handler;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/content/Context;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;Landroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V

    .line 447
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    const-wide/16 v6, 0x2710

    add-long v18, v2, v6

    .line 448
    .local v18, endTime:J
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/app/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    monitor-enter v3

    .line 449
    :goto_3
    :try_start_1
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/internal/app/ShutdownThread;->mActionDone:Z

    if-nez v2, :cond_1

    .line 450
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sub-long v13, v18, v6

    .line 451
    .restart local v13       #delay:J
    const-wide/16 v6, 0x0

    cmp-long v2, v13, v6

    if-gtz v2, :cond_10

    .line 452
    const-string v2, "ShutdownThread"

    const-string v4, "Shutdown broadcast timed out. Enter normal shutdown"

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 453
    const/4 v2, 0x0

    sput-boolean v2, Lcom/android/internal/app/ShutdownThread;->mIsQuickbootShutdown:Z

    .line 461
    .end local v13           #delay:J
    :cond_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 463
    sget-boolean v2, Lcom/android/internal/app/ShutdownThread;->mIsQuickbootShutdown:Z

    if-nez v2, :cond_2

    .line 464
    const-string v2, "ShutdownThread"

    const-string v3, "Shutting down activity manager..."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 466
    const-string v2, "activity"

    invoke-static {v2}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/app/ActivityManagerNative;->asInterface(Landroid/os/IBinder;)Landroid/app/IActivityManager;

    move-result-object v10

    .line 468
    .local v10, am:Landroid/app/IActivityManager;
    if-eqz v10, :cond_2

    .line 470
    const/16 v2, 0x2710

    :try_start_2
    invoke-interface {v10, v2}, Landroid/app/IActivityManager;->shutdown(I)Z
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_9

    .line 476
    .end local v10           #am:Landroid/app/IActivityManager;
    :cond_2
    :goto_4
    const-string/jumbo v2, "phone"

    invoke-static {v2}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v26

    .line 478
    .local v26, phone:Lcom/android/internal/telephony/ITelephony;
    const-string v2, "bluetooth"

    invoke-static {v2}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/bluetooth/IBluetooth$Stub;->asInterface(Landroid/os/IBinder;)Landroid/bluetooth/IBluetooth;

    move-result-object v11

    .line 482
    .local v11, bluetooth:Landroid/bluetooth/IBluetooth;
    const-string/jumbo v2, "mount"

    invoke-static {v2}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/os/storage/IMountService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/storage/IMountService;

    move-result-object v24

    .line 487
    .local v24, mount:Landroid/os/storage/IMountService;
    if-eqz v11, :cond_3

    :try_start_3
    invoke-interface {v11}, Landroid/bluetooth/IBluetooth;->getBluetoothState()I

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_11

    :cond_3
    const/4 v12, 0x1

    .line 489
    .local v12, bluetoothOff:Z
    :goto_5
    if-nez v12, :cond_4

    .line 490
    const-string v2, "ShutdownThread"

    const-string v3, "Disabling Bluetooth..."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 491
    const/4 v2, 0x0

    invoke-interface {v11, v2}, Landroid/bluetooth/IBluetooth;->disable(Z)Z
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_2

    .line 499
    :cond_4
    :goto_6
    if-eqz v26, :cond_5

    :try_start_4
    invoke-interface/range {v26 .. v26}, Lcom/android/internal/telephony/ITelephony;->isRadioOn()Z

    move-result v2

    if-nez v2, :cond_12

    :cond_5
    const/16 v27, 0x1

    .line 500
    .local v27, radioOff:Z
    :goto_7
    if-nez v27, :cond_6

    .line 501
    const-string v2, "ShutdownThread"

    const-string v3, "Turning off radio..."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 502
    const/4 v2, 0x0

    move-object/from16 v0, v26

    invoke-interface {v0, v2}, Lcom/android/internal/telephony/ITelephony;->setRadio(Z)Z
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_3

    .line 509
    :cond_6
    :goto_8
    const-string v2, "ShutdownThread"

    const-string v3, "Waiting for Bluetooth and Radio..."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 512
    const/16 v23, 0x0

    .local v23, i:I
    :goto_9
    const/16 v2, 0x10

    move/from16 v0, v23

    if-ge v0, v2, :cond_9

    .line 513
    if-nez v12, :cond_7

    .line 515
    :try_start_5
    invoke-interface {v11}, Landroid/bluetooth/IBluetooth;->getBluetoothState()I
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_4

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_13

    const/4 v12, 0x1

    .line 522
    :cond_7
    :goto_a
    if-nez v27, :cond_8

    .line 524
    :try_start_6
    invoke-interface/range {v26 .. v26}, Lcom/android/internal/telephony/ITelephony;->isRadioOn()Z
    :try_end_6
    .catch Landroid/os/RemoteException; {:try_start_6 .. :try_end_6} :catch_5

    move-result v2

    if-nez v2, :cond_14

    const/16 v27, 0x1

    .line 530
    :cond_8
    :goto_b
    if-eqz v27, :cond_15

    if-eqz v12, :cond_15

    .line 531
    const-string v2, "ShutdownThread"

    const-string v3, "Radio and Bluetooth shutdown complete."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 537
    :cond_9
    invoke-static {}, Landroid/os/Environment;->isExternalStorageRemovable()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 539
    new-instance v25, Lcom/android/internal/app/ShutdownThread$8;

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/android/internal/app/ShutdownThread$8;-><init>(Lcom/android/internal/app/ShutdownThread;)V

    .line 546
    .local v25, observer:Landroid/os/storage/IMountShutdownObserver;
    const-string v2, "ShutdownThread"

    const-string v3, "Shutting down MountService"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 548
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/android/internal/app/ShutdownThread;->mActionDone:Z

    .line 549
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    const-wide/16 v6, 0x4e20

    add-long v16, v2, v6

    .line 550
    .local v16, endShutTime:J
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/app/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    monitor-enter v3

    .line 552
    if-eqz v24, :cond_16

    .line 553
    :try_start_7
    invoke-interface/range {v24 .. v25}, Landroid/os/storage/IMountService;->shutdown(Landroid/os/storage/IMountShutdownObserver;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    .line 560
    :goto_c
    :try_start_8
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/internal/app/ShutdownThread;->mActionDone:Z

    if-nez v2, :cond_a

    .line 561
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sub-long v13, v16, v6

    .line 562
    .restart local v13       #delay:J
    const-wide/16 v6, 0x0

    cmp-long v2, v13, v6

    if-gtz v2, :cond_17

    .line 563
    const-string v2, "ShutdownThread"

    const-string v4, "Shutdown wait timed out"

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 571
    .end local v13           #delay:J
    :cond_a
    monitor-exit v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 574
    .end local v16           #endShutTime:J
    .end local v25           #observer:Landroid/os/storage/IMountShutdownObserver;
    :cond_b
    sget-boolean v2, Lcom/android/internal/app/ShutdownThread;->mIsQuickbootShutdown:Z

    if-eqz v2, :cond_1b

    .line 575
    const-string v2, "ShutdownThread"

    const-string v3, "Entering quickboot poweroff state."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 576
    sget-object v2, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    iget-object v2, v2, Lcom/android/internal/app/ShutdownThread;->mScreenWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v2, :cond_c

    sget-object v2, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    iget-object v2, v2, Lcom/android/internal/app/ShutdownThread;->mScreenWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v2

    if-eqz v2, :cond_c

    .line 577
    sget-object v2, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    iget-object v2, v2, Lcom/android/internal/app/ShutdownThread;->mScreenWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 578
    sget-object v2, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    const/4 v3, 0x0

    iput-object v3, v2, Lcom/android/internal/app/ShutdownThread;->mScreenWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 581
    :cond_c
    sget-object v2, Lcom/android/internal/app/ShutdownThread;->mQbManager:Lcom/android/internal/app/QuickbootManager;

    if-eqz v2, :cond_1a

    .line 582
    sget-object v2, Lcom/android/internal/app/ShutdownThread;->mQbManager:Lcom/android/internal/app/QuickbootManager;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/app/ShutdownThread;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/android/internal/app/QuickbootManager;->shutdown(Landroid/content/Context;)Z

    move-result v29

    .line 583
    .local v29, ret:Z
    if-nez v29, :cond_18

    .line 584
    sget-boolean v2, Lcom/android/internal/app/ShutdownThread;->mReboot:Z

    sget-object v3, Lcom/android/internal/app/ShutdownThread;->mRebootReason:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/android/internal/app/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    .line 623
    .end local v29           #ret:Z
    :goto_d
    return-void

    .line 415
    .end local v11           #bluetooth:Landroid/bluetooth/IBluetooth;
    .end local v12           #bluetoothOff:Z
    .end local v18           #endTime:J
    .end local v20           #endTimeQb:J
    .end local v23           #i:I
    .end local v24           #mount:Landroid/os/storage/IMountService;
    .end local v26           #phone:Lcom/android/internal/telephony/ITelephony;
    .end local v27           #radioOff:Z
    .end local v28           #reason:Ljava/lang/String;
    :cond_d
    const-string v2, "0"

    goto/16 :goto_0

    :cond_e
    const-string v2, ""

    goto/16 :goto_1

    .line 436
    .restart local v13       #delay:J
    .restart local v20       #endTimeQb:J
    .restart local v28       #reason:Ljava/lang/String;
    :cond_f
    :try_start_9
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/app/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    invoke-virtual {v2, v13, v14}, Ljava/lang/Object;->wait(J)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_9} :catch_0

    goto/16 :goto_2

    .line 437
    :catch_0
    move-exception v2

    goto/16 :goto_2

    .line 440
    .end local v13           #delay:J
    :catchall_0
    move-exception v2

    :try_start_a
    monitor-exit v3
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    throw v2

    .line 457
    .restart local v13       #delay:J
    .restart local v18       #endTime:J
    :cond_10
    :try_start_b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/app/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    invoke-virtual {v2, v13, v14}, Ljava/lang/Object;->wait(J)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1
    .catch Ljava/lang/InterruptedException; {:try_start_b .. :try_end_b} :catch_1

    goto/16 :goto_3

    .line 458
    :catch_1
    move-exception v2

    goto/16 :goto_3

    .line 461
    .end local v13           #delay:J
    :catchall_1
    move-exception v2

    :try_start_c
    monitor-exit v3
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    throw v2

    .line 487
    .restart local v11       #bluetooth:Landroid/bluetooth/IBluetooth;
    .restart local v24       #mount:Landroid/os/storage/IMountService;
    .restart local v26       #phone:Lcom/android/internal/telephony/ITelephony;
    :cond_11
    const/4 v12, 0x0

    goto/16 :goto_5

    .line 493
    :catch_2
    move-exception v22

    .line 494
    .local v22, ex:Landroid/os/RemoteException;
    const-string v2, "ShutdownThread"

    const-string v3, "RemoteException during bluetooth shutdown"

    move-object/from16 v0, v22

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 495
    const/4 v12, 0x1

    .restart local v12       #bluetoothOff:Z
    goto/16 :goto_6

    .line 499
    .end local v22           #ex:Landroid/os/RemoteException;
    :cond_12
    const/16 v27, 0x0

    goto/16 :goto_7

    .line 504
    :catch_3
    move-exception v22

    .line 505
    .restart local v22       #ex:Landroid/os/RemoteException;
    const-string v2, "ShutdownThread"

    const-string v3, "RemoteException during radio shutdown"

    move-object/from16 v0, v22

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 506
    const/16 v27, 0x1

    .restart local v27       #radioOff:Z
    goto/16 :goto_8

    .line 515
    .end local v22           #ex:Landroid/os/RemoteException;
    .restart local v23       #i:I
    :cond_13
    const/4 v12, 0x0

    goto/16 :goto_a

    .line 517
    :catch_4
    move-exception v22

    .line 518
    .restart local v22       #ex:Landroid/os/RemoteException;
    const-string v2, "ShutdownThread"

    const-string v3, "RemoteException during bluetooth shutdown"

    move-object/from16 v0, v22

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 519
    const/4 v12, 0x1

    goto/16 :goto_a

    .line 524
    .end local v22           #ex:Landroid/os/RemoteException;
    :cond_14
    const/16 v27, 0x0

    goto/16 :goto_b

    .line 525
    :catch_5
    move-exception v22

    .line 526
    .restart local v22       #ex:Landroid/os/RemoteException;
    const-string v2, "ShutdownThread"

    const-string v3, "RemoteException during radio shutdown"

    move-object/from16 v0, v22

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 527
    const/16 v27, 0x1

    goto/16 :goto_b

    .line 534
    .end local v22           #ex:Landroid/os/RemoteException;
    :cond_15
    const-wide/16 v2, 0x1f4

    invoke-static {v2, v3}, Landroid/os/SystemClock;->sleep(J)V

    .line 512
    add-int/lit8 v23, v23, 0x1

    goto/16 :goto_9

    .line 555
    .restart local v16       #endShutTime:J
    .restart local v25       #observer:Landroid/os/storage/IMountShutdownObserver;
    :cond_16
    :try_start_d
    const-string v2, "ShutdownThread"

    const-string v4, "MountService unavailable for shutdown"

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_6

    goto/16 :goto_c

    .line 557
    :catch_6
    move-exception v15

    .line 558
    .local v15, e:Ljava/lang/Exception;
    :try_start_e
    const-string v2, "ShutdownThread"

    const-string v4, "Exception during MountService shutdown"

    invoke-static {v2, v4, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_c

    .line 571
    .end local v15           #e:Ljava/lang/Exception;
    :catchall_2
    move-exception v2

    monitor-exit v3
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    throw v2

    .line 567
    .restart local v13       #delay:J
    :cond_17
    :try_start_f
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/app/ShutdownThread;->mActionDoneSync:Ljava/lang/Object;

    invoke-virtual {v2, v13, v14}, Ljava/lang/Object;->wait(J)V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_2
    .catch Ljava/lang/InterruptedException; {:try_start_f .. :try_end_f} :catch_7

    goto/16 :goto_c

    .line 568
    :catch_7
    move-exception v2

    goto/16 :goto_c

    .line 588
    .end local v13           #delay:J
    .end local v16           #endShutTime:J
    .end local v25           #observer:Landroid/os/storage/IMountShutdownObserver;
    .restart local v29       #ret:Z
    :cond_18
    sget-object v3, Lcom/android/internal/app/ShutdownThread;->sIsStartedGuard:Ljava/lang/Object;

    monitor-enter v3

    .line 589
    :try_start_10
    sget-boolean v2, Lcom/android/internal/app/ShutdownThread;->sIsStarted:Z

    if-eqz v2, :cond_19

    .line 590
    const/4 v2, 0x0

    sput-boolean v2, Lcom/android/internal/app/ShutdownThread;->sIsStarted:Z

    .line 592
    :cond_19
    monitor-exit v3
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_4

    .line 596
    new-instance v30, Landroid/os/Vibrator;

    invoke-direct/range {v30 .. v30}, Landroid/os/Vibrator;-><init>()V

    .line 598
    .local v30, vibrator:Landroid/os/Vibrator;
    const-wide/16 v2, 0x1f4

    :try_start_11
    move-object/from16 v0, v30

    invoke-virtual {v0, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V

    .line 599
    const-wide/16 v2, 0x1f4

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_8

    .line 606
    :goto_e
    invoke-static {}, Lcom/android/internal/app/ShutdownThread;->dismissDialog()V

    .line 607
    sget-object v2, Lcom/android/internal/app/ShutdownThread;->sInstance:Lcom/android/internal/app/ShutdownThread;

    iget-object v2, v2, Lcom/android/internal/app/ShutdownThread;->mCpuWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 609
    sget-object v3, Lcom/android/internal/app/ShutdownThread;->mShutdownThreadSync:Ljava/lang/Object;

    monitor-enter v3

    .line 611
    :try_start_12
    sget-object v2, Lcom/android/internal/app/ShutdownThread;->mShutdownThreadSync:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_3
    .catch Ljava/lang/InterruptedException; {:try_start_12 .. :try_end_12} :catch_a

    .line 614
    :goto_f
    :try_start_13
    monitor-exit v3

    goto/16 :goto_d

    :catchall_3
    move-exception v2

    monitor-exit v3
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_3

    throw v2

    .line 592
    .end local v30           #vibrator:Landroid/os/Vibrator;
    :catchall_4
    move-exception v2

    :try_start_14
    monitor-exit v3
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_4

    throw v2

    .line 600
    .restart local v30       #vibrator:Landroid/os/Vibrator;
    :catch_8
    move-exception v15

    .line 602
    .restart local v15       #e:Ljava/lang/Exception;
    const-string v2, "ShutdownThread"

    const-string v3, "Failed to vibrate during shutdown."

    invoke-static {v2, v3, v15}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_e

    .line 616
    .end local v15           #e:Ljava/lang/Exception;
    .end local v29           #ret:Z
    .end local v30           #vibrator:Landroid/os/Vibrator;
    :cond_1a
    const-string v2, "ShutdownThread"

    const-string v3, "Life is so hard!"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 617
    const/4 v2, 0x0

    sput-boolean v2, Lcom/android/internal/app/ShutdownThread;->mIsQuickbootShutdown:Z

    .line 618
    sget-boolean v2, Lcom/android/internal/app/ShutdownThread;->mReboot:Z

    sget-object v3, Lcom/android/internal/app/ShutdownThread;->mRebootReason:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/android/internal/app/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    goto/16 :goto_d

    .line 621
    :cond_1b
    sget-boolean v2, Lcom/android/internal/app/ShutdownThread;->mReboot:Z

    sget-object v3, Lcom/android/internal/app/ShutdownThread;->mRebootReason:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/android/internal/app/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    goto/16 :goto_d

    .line 471
    .end local v11           #bluetooth:Landroid/bluetooth/IBluetooth;
    .end local v12           #bluetoothOff:Z
    .end local v23           #i:I
    .end local v24           #mount:Landroid/os/storage/IMountService;
    .end local v26           #phone:Lcom/android/internal/telephony/ITelephony;
    .end local v27           #radioOff:Z
    .restart local v10       #am:Landroid/app/IActivityManager;
    :catch_9
    move-exception v2

    goto/16 :goto_4

    .line 612
    .end local v10           #am:Landroid/app/IActivityManager;
    .restart local v11       #bluetooth:Landroid/bluetooth/IBluetooth;
    .restart local v12       #bluetoothOff:Z
    .restart local v23       #i:I
    .restart local v24       #mount:Landroid/os/storage/IMountService;
    .restart local v26       #phone:Lcom/android/internal/telephony/ITelephony;
    .restart local v27       #radioOff:Z
    .restart local v29       #ret:Z
    .restart local v30       #vibrator:Landroid/os/Vibrator;
    :catch_a
    move-exception v2

    goto :goto_f
.end method

.method public run()V
    .locals 2

    .prologue
    .line 379
    invoke-static {}, Lcom/android/internal/app/ShutdownThread;->checkShutdownFlow()V

    .line 380
    :goto_0
    sget-boolean v0, Lcom/android/internal/app/ShutdownThread;->mIsQuickbootShutdown:Z

    if-eqz v0, :cond_0

    .line 381
    const-string v0, "ShutdownThread"

    const-string v1, "enter quickboot shutdown flow..."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    invoke-virtual {p0}, Lcom/android/internal/app/ShutdownThread;->quickbootShutdown()V

    goto :goto_0

    .line 385
    :cond_0
    sget-boolean v0, Lcom/android/internal/app/ShutdownThread;->mIsQuickbootShutdown:Z

    if-nez v0, :cond_1

    .line 386
    const-string v0, "ShutdownThread"

    const-string v1, "enter normal shutdown flow..."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    invoke-virtual {p0}, Lcom/android/internal/app/ShutdownThread;->normalShutdown()V

    .line 390
    :cond_1
    return-void
.end method
