.class final Lcom/htc/server/WirelessDisplayService$RecorderErrorCallback;
.super Ljava/lang/Object;
.source "WirelessDisplayService.java"

# interfaces
.implements Landroid/media/MediaRecorder$OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/htc/server/WirelessDisplayService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "RecorderErrorCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/htc/server/WirelessDisplayService;


# direct methods
.method private constructor <init>(Lcom/htc/server/WirelessDisplayService;)V
    .locals 0
    .parameter

    .prologue
    .line 3650
    iput-object p1, p0, Lcom/htc/server/WirelessDisplayService$RecorderErrorCallback;->this$0:Lcom/htc/server/WirelessDisplayService;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/htc/server/WirelessDisplayService;Lcom/htc/server/WirelessDisplayService$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 3650
    invoke-direct {p0, p1}, Lcom/htc/server/WirelessDisplayService$RecorderErrorCallback;-><init>(Lcom/htc/server/WirelessDisplayService;)V

    return-void
.end method


# virtual methods
.method public onError(Landroid/media/MediaRecorder;II)V
    .locals 5
    .parameter "mr"
    .parameter "what"
    .parameter "extra"

    .prologue
    const/16 v4, 0x33

    .line 3653
    const-string v1, "WirelessDisplayService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "MEDIA RCORDER ERROR:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3657
    iget-object v1, p0, Lcom/htc/server/WirelessDisplayService$RecorderErrorCallback;->this$0:Lcom/htc/server/WirelessDisplayService;

    #calls: Lcom/htc/server/WirelessDisplayService;->stopDisplayRecorder()I
    invoke-static {v1}, Lcom/htc/server/WirelessDisplayService;->access$4100(Lcom/htc/server/WirelessDisplayService;)I

    .line 3658
    iget-object v1, p0, Lcom/htc/server/WirelessDisplayService$RecorderErrorCallback;->this$0:Lcom/htc/server/WirelessDisplayService;

    const/4 v2, 0x1

    const/4 v3, 0x0

    #calls: Lcom/htc/server/WirelessDisplayService;->setMirrorModeState(II)V
    invoke-static {v1, v2, v3}, Lcom/htc/server/WirelessDisplayService;->access$200(Lcom/htc/server/WirelessDisplayService;II)V

    .line 3659
    invoke-static {}, Lcom/htc/server/WirelessDisplayService;->access$2500()Lcom/htc/server/WirelessDisplayService$H;

    move-result-object v1

    const/16 v2, 0x36

    const/4 v3, -0x1

    invoke-virtual {v1, v4, v2, v3}, Lcom/htc/server/WirelessDisplayService$H;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    .line 3660
    .local v0, msg:Landroid/os/Message;
    invoke-static {}, Lcom/htc/server/WirelessDisplayService;->access$2500()Lcom/htc/server/WirelessDisplayService$H;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/htc/server/WirelessDisplayService$H;->removeMessages(I)V

    .line 3661
    invoke-static {}, Lcom/htc/server/WirelessDisplayService;->access$2500()Lcom/htc/server/WirelessDisplayService$H;

    move-result-object v1

    const-wide/16 v2, 0x2

    invoke-virtual {v1, v0, v2, v3}, Lcom/htc/server/WirelessDisplayService$H;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 3662
    return-void
.end method