.class Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$2;
.super Ljava/lang/Object;
.source "HtcDLNAServiceManager.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;->connect(Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$DLNAServiceStatusListener;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;


# direct methods
.method constructor <init>(Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;)V
    .locals 0
    .parameter

    .prologue
    .line 272
    iput-object p1, p0, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$2;->this$0:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 5
    .parameter "name"
    .parameter "binder"

    .prologue
    .line 279
    iget-object v2, p0, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$2;->this$0:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;

    invoke-static {p2}, Lcom/htc/dlnainterface/IDLNAPluginService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/htc/dlnainterface/IDLNAPluginService;

    move-result-object v3

    iput-object v3, v2, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;->mService:Lcom/htc/dlnainterface/IDLNAPluginService;

    .line 280
    const-string v2, "HtcDLNAServiceManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[onServiceConnected] mService = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$2;->this$0:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;

    iget-object v4, v4, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;->mService:Lcom/htc/dlnainterface/IDLNAPluginService;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", classname = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", IBinder="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/media/dlnasharedmodule/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    iget-object v2, p0, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$2;->this$0:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;

    iget-object v2, v2, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;->mService:Lcom/htc/dlnainterface/IDLNAPluginService;

    if-nez v2, :cond_1

    .line 283
    iget-object v2, p0, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$2;->this$0:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;

    #getter for: Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;->mDLNAServiceStatusListener:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$DLNAServiceStatusListener;
    invoke-static {v2}, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;->access$000(Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;)Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$DLNAServiceStatusListener;

    move-result-object v0

    .line 284
    .local v0, clientListener:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$DLNAServiceStatusListener;
    if-eqz v0, :cond_0

    .line 285
    invoke-interface {v0}, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$DLNAServiceStatusListener;->onServiceDisconnected()V

    .line 303
    :cond_0
    :goto_0
    return-void

    .line 291
    .end local v0           #clientListener:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$DLNAServiceStatusListener;
    :cond_1
    :try_start_0
    iget-object v2, p0, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$2;->this$0:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;

    iget-object v2, v2, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;->mService:Lcom/htc/dlnainterface/IDLNAPluginService;

    iget-object v3, p0, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$2;->this$0:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;

    #getter for: Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;->mCookie:I
    invoke-static {v3}, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;->access$100(Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;)I

    move-result v3

    iget-object v4, p0, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$2;->this$0:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;

    #getter for: Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;->mMiddleLayerListener:Landroid/media/dlnasharedmodule/HtcDLNAMiddleLayerListener;
    invoke-static {v4}, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;->access$200(Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;)Landroid/media/dlnasharedmodule/HtcDLNAMiddleLayerListener;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/htc/dlnainterface/IDLNAPluginService;->registerCallback(ILcom/htc/dlnainterface/IDLNAPluginNotify;)V

    .line 292
    iget-object v2, p0, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$2;->this$0:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;

    iget-object v2, v2, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;->mService:Lcom/htc/dlnainterface/IDLNAPluginService;

    iget-object v3, p0, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$2;->this$0:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;

    #getter for: Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;->mCookie:I
    invoke-static {v3}, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;->access$100(Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;)I

    move-result v3

    const-string v4, "JPEG_SM,JPEG_TN,PNG_TN"

    invoke-interface {v2, v3, v4}, Lcom/htc/dlnainterface/IDLNAPluginService;->setDMCThumbSize(ILjava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 300
    :goto_1
    iget-object v2, p0, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$2;->this$0:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;

    #getter for: Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;->mDLNAServiceStatusListener:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$DLNAServiceStatusListener;
    invoke-static {v2}, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;->access$000(Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;)Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$DLNAServiceStatusListener;

    move-result-object v0

    .line 301
    .restart local v0       #clientListener:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$DLNAServiceStatusListener;
    if-eqz v0, :cond_0

    .line 302
    invoke-interface {v0}, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$DLNAServiceStatusListener;->onServiceConnected()V

    goto :goto_0

    .line 294
    .end local v0           #clientListener:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$DLNAServiceStatusListener;
    :catch_0
    move-exception v1

    .line 297
    .local v1, ex:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 4
    .parameter "name"

    .prologue
    .line 309
    const-string v1, "HtcDLNAServiceManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[onServiceDisconnected] classname = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/media/dlnasharedmodule/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 310
    iget-object v1, p0, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$2;->this$0:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;

    #getter for: Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;->mDLNAServiceStatusListener:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$DLNAServiceStatusListener;
    invoke-static {v1}, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;->access$000(Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;)Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$DLNAServiceStatusListener;

    move-result-object v0

    .line 311
    .local v0, clientListener:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$DLNAServiceStatusListener;
    if-eqz v0, :cond_0

    .line 312
    invoke-interface {v0}, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$DLNAServiceStatusListener;->onServiceDisconnected()V

    .line 313
    :cond_0
    iget-object v1, p0, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager$2;->this$0:Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;

    const/4 v2, 0x0

    iput-object v2, v1, Landroid/media/dlnasharedmodule/HtcDLNAServiceManager;->mService:Lcom/htc/dlnainterface/IDLNAPluginService;

    .line 314
    return-void
.end method
