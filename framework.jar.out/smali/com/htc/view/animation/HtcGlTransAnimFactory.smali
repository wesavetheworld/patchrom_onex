.class public Lcom/htc/view/animation/HtcGlTransAnimFactory;
.super Ljava/lang/Object;
.source "HtcGlTransAnimFactory.java"


# static fields
.field public static final OPEN_ALL_HTC_TRANSITION_ANIM:Z

.field public static final USE_HTC_TRANSITION_ANIM:Z

.field private static final mAnimTypeMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 30
    sget-object v2, Lcom/htc/htcjavaflag/HtcBuildFlag;->Htc_Sense_Version:Ljava/lang/String;

    const-string v3, "4.0"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "use_htcgl_anim"

    invoke-static {v2, v0}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    const-string v2, "force_close_htcgl_anim"

    invoke-static {v2, v0}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_1

    move v0, v1

    :cond_1
    sput-boolean v0, Lcom/htc/view/animation/HtcGlTransAnimFactory;->USE_HTC_TRANSITION_ANIM:Z

    .line 37
    const-string/jumbo v0, "open_all_htcgl_anim"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/htc/view/animation/HtcGlTransAnimFactory;->OPEN_ALL_HTC_TRANSITION_ANIM:Z

    .line 41
    sget-object v0, Lcom/htc/view/animation/HtcGlAnimType;->mAnimTypeMap:Ljava/util/HashMap;

    sput-object v0, Lcom/htc/view/animation/HtcGlTransAnimFactory;->mAnimTypeMap:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createGlAnim(Landroid/content/Context;Landroid/util/AttributeSet;)Lcom/htc/view/animation/HtcBaseGlTransAnim;
    .locals 5
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 107
    sget-object v3, Lcom/android/internal/R$styleable;->TextView:[I

    invoke-virtual {p0, p1, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 110
    .local v0, a:Landroid/content/res/TypedArray;
    const/16 v3, 0x13

    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 111
    .local v1, anim_type:Ljava/lang/String;
    const/4 v2, 0x0

    .line 114
    .local v2, glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    sget-boolean v3, Lcom/htc/view/animation/HtcGlTransAnimFactory;->OPEN_ALL_HTC_TRANSITION_ANIM:Z

    if-nez v3, :cond_0

    :goto_0
    move-object v3, v2

    .line 161
    :goto_1
    return-object v3

    .line 118
    :cond_0
    sget-object v3, Lcom/htc/view/animation/HtcGlTransAnimFactory;->mAnimTypeMap:Ljava/util/HashMap;

    const/16 v4, 0xa

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 119
    new-instance v2, Lcom/htc/view/animation/HtcGlZoomTransAnim;

    .end local v2           #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    invoke-direct {v2, p0, p1}, Lcom/htc/view/animation/HtcGlZoomTransAnim;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .restart local v2       #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    goto :goto_0

    .line 124
    :cond_1
    sget-object v3, Lcom/htc/view/animation/HtcGlTransAnimFactory;->mAnimTypeMap:Ljava/util/HashMap;

    const/16 v4, 0xb

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 125
    new-instance v2, Lcom/htc/view/animation/HtcGlCubicRotateTransAnim;

    .end local v2           #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    invoke-direct {v2, p0, p1}, Lcom/htc/view/animation/HtcGlCubicRotateTransAnim;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .restart local v2       #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    goto :goto_0

    .line 130
    :cond_2
    sget-object v3, Lcom/htc/view/animation/HtcGlTransAnimFactory;->mAnimTypeMap:Ljava/util/HashMap;

    const/16 v4, 0xc

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 131
    new-instance v2, Lcom/htc/view/animation/HtcGlCentralZoomTransAnim;

    .end local v2           #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    invoke-direct {v2, p0, p1}, Lcom/htc/view/animation/HtcGlCentralZoomTransAnim;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .restart local v2       #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    goto :goto_0

    .line 136
    :cond_3
    sget-object v3, Lcom/htc/view/animation/HtcGlTransAnimFactory;->mAnimTypeMap:Ljava/util/HashMap;

    const/16 v4, 0xd

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 137
    new-instance v2, Lcom/htc/view/animation/HtcGlContentZoomTransAnim;

    .end local v2           #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    invoke-direct {v2, p0, p1}, Lcom/htc/view/animation/HtcGlContentZoomTransAnim;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .restart local v2       #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    goto :goto_0

    .line 142
    :cond_4
    sget-object v3, Lcom/htc/view/animation/HtcGlTransAnimFactory;->mAnimTypeMap:Ljava/util/HashMap;

    const/16 v4, 0xe

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 143
    new-instance v2, Lcom/htc/view/animation/HtcGlRecentAppZoomTransAnim;

    .end local v2           #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    invoke-direct {v2, p0, p1}, Lcom/htc/view/animation/HtcGlRecentAppZoomTransAnim;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .restart local v2       #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    goto :goto_0

    .line 148
    :cond_5
    sget-object v3, Lcom/htc/view/animation/HtcGlTransAnimFactory;->mAnimTypeMap:Ljava/util/HashMap;

    const/16 v4, 0xf

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 149
    new-instance v2, Lcom/htc/view/animation/HtcGlSwipeCubicTransAnim;

    .end local v2           #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    invoke-direct {v2, p0, p1}, Lcom/htc/view/animation/HtcGlSwipeCubicTransAnim;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .restart local v2       #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    goto/16 :goto_0

    .line 158
    :cond_6
    const/4 v3, 0x0

    goto/16 :goto_1
.end method

.method public static createGlAnim(Landroid/os/Parcel;)Lcom/htc/view/animation/HtcBaseGlTransAnim;
    .locals 3
    .parameter "in"

    .prologue
    .line 171
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 173
    .local v0, anim_type:I
    const/4 v1, 0x0

    .line 175
    .local v1, glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    const/16 v2, 0xa

    if-ne v0, v2, :cond_0

    .line 176
    new-instance v1, Lcom/htc/view/animation/HtcGlZoomTransAnim;

    .end local v1           #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    invoke-direct {v1, p0}, Lcom/htc/view/animation/HtcGlZoomTransAnim;-><init>(Landroid/os/Parcel;)V

    .restart local v1       #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    :goto_0
    move-object v2, v1

    .line 218
    :goto_1
    return-object v2

    .line 181
    :cond_0
    const/16 v2, 0xb

    if-ne v0, v2, :cond_1

    .line 182
    new-instance v1, Lcom/htc/view/animation/HtcGlCubicRotateTransAnim;

    .end local v1           #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    invoke-direct {v1, p0}, Lcom/htc/view/animation/HtcGlCubicRotateTransAnim;-><init>(Landroid/os/Parcel;)V

    .restart local v1       #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    goto :goto_0

    .line 187
    :cond_1
    const/16 v2, 0xc

    if-ne v0, v2, :cond_2

    .line 188
    new-instance v1, Lcom/htc/view/animation/HtcGlCentralZoomTransAnim;

    .end local v1           #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    invoke-direct {v1, p0}, Lcom/htc/view/animation/HtcGlCentralZoomTransAnim;-><init>(Landroid/os/Parcel;)V

    .restart local v1       #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    goto :goto_0

    .line 193
    :cond_2
    const/16 v2, 0xd

    if-ne v0, v2, :cond_3

    .line 194
    new-instance v1, Lcom/htc/view/animation/HtcGlContentZoomTransAnim;

    .end local v1           #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    invoke-direct {v1, p0}, Lcom/htc/view/animation/HtcGlContentZoomTransAnim;-><init>(Landroid/os/Parcel;)V

    .restart local v1       #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    goto :goto_0

    .line 199
    :cond_3
    const/16 v2, 0xe

    if-ne v0, v2, :cond_4

    .line 200
    new-instance v1, Lcom/htc/view/animation/HtcGlRecentAppZoomTransAnim;

    .end local v1           #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    invoke-direct {v1, p0}, Lcom/htc/view/animation/HtcGlRecentAppZoomTransAnim;-><init>(Landroid/os/Parcel;)V

    .restart local v1       #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    goto :goto_0

    .line 205
    :cond_4
    const/16 v2, 0xf

    if-ne v0, v2, :cond_5

    .line 206
    new-instance v1, Lcom/htc/view/animation/HtcGlSwipeCubicTransAnim;

    .end local v1           #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    invoke-direct {v1, p0}, Lcom/htc/view/animation/HtcGlSwipeCubicTransAnim;-><init>(Landroid/os/Parcel;)V

    .restart local v1       #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    goto :goto_0

    .line 215
    :cond_5
    const/4 v2, 0x0

    goto :goto_1
.end method


# virtual methods
.method public createGlAnim(Ljava/lang/String;)Lcom/htc/view/animation/HtcBaseGlTransAnim;
    .locals 3
    .parameter "anim_type"

    .prologue
    const/4 v1, 0x0

    .line 46
    if-nez p1, :cond_0

    move-object v0, v1

    .line 99
    :goto_0
    return-object v0

    .line 53
    :cond_0
    const/4 v0, 0x0

    .line 55
    .local v0, glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    const-string/jumbo v2, "zoom"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 56
    new-instance v0, Lcom/htc/view/animation/HtcGlZoomTransAnim;

    .end local v0           #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    invoke-direct {v0}, Lcom/htc/view/animation/HtcGlZoomTransAnim;-><init>()V

    .restart local v0       #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    goto :goto_0

    .line 61
    :cond_1
    const-string v2, "cubic_rotate"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 62
    new-instance v0, Lcom/htc/view/animation/HtcGlCubicRotateTransAnim;

    .end local v0           #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    invoke-direct {v0}, Lcom/htc/view/animation/HtcGlCubicRotateTransAnim;-><init>()V

    .restart local v0       #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    goto :goto_0

    .line 67
    :cond_2
    const-string v2, "central_zoom"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 68
    new-instance v0, Lcom/htc/view/animation/HtcGlCentralZoomTransAnim;

    .end local v0           #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    invoke-direct {v0}, Lcom/htc/view/animation/HtcGlCentralZoomTransAnim;-><init>()V

    .restart local v0       #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    goto :goto_0

    .line 73
    :cond_3
    const-string v2, "content_zoom"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 74
    new-instance v0, Lcom/htc/view/animation/HtcGlContentZoomTransAnim;

    .end local v0           #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    invoke-direct {v0}, Lcom/htc/view/animation/HtcGlContentZoomTransAnim;-><init>()V

    .restart local v0       #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    goto :goto_0

    .line 79
    :cond_4
    const-string/jumbo v2, "recentapp_zoom"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 81
    new-instance v0, Lcom/htc/view/animation/HtcGlRecentAppZoomTransAnim;

    .end local v0           #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    invoke-direct {v0}, Lcom/htc/view/animation/HtcGlRecentAppZoomTransAnim;-><init>()V

    .restart local v0       #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    goto :goto_0

    .line 86
    :cond_5
    const-string/jumbo v2, "swipe_cubic"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 88
    new-instance v0, Lcom/htc/view/animation/HtcGlSwipeCubicTransAnim;

    .end local v0           #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    invoke-direct {v0}, Lcom/htc/view/animation/HtcGlSwipeCubicTransAnim;-><init>()V

    .restart local v0       #glAnim:Lcom/htc/view/animation/HtcBaseGlTransAnim;
    goto :goto_0

    :cond_6
    move-object v0, v1

    .line 96
    goto :goto_0
.end method

.method public overrideHtcGlAppTransAnim(Lcom/htc/view/animation/HtcBaseGlTransAnim;)V
    .locals 2
    .parameter "animObj"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 222
    if-nez p1, :cond_1

    .line 242
    :cond_0
    :goto_0
    return-void

    .line 229
    :cond_1
    sget-boolean v0, Lcom/htc/view/animation/HtcGlTransAnimFactory;->OPEN_ALL_HTC_TRANSITION_ANIM:Z

    if-nez v0, :cond_2

    .line 230
    invoke-virtual {p1}, Lcom/htc/view/animation/HtcBaseGlTransAnim;->getAnimationType()I

    move-result v0

    const/16 v1, 0xf

    if-eq v0, v1, :cond_2

    invoke-virtual {p1}, Lcom/htc/view/animation/HtcBaseGlTransAnim;->getAnimationType()I

    move-result v0

    const/16 v1, 0xe

    if-ne v0, v1, :cond_0

    .line 240
    :cond_2
    const-string/jumbo v0, "window"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object v0

    invoke-interface {v0, p1, p1}, Landroid/view/IWindowManager;->overrideHtcGlAppTransAnim(Lcom/htc/view/animation/HtcBaseGlTransAnim;Lcom/htc/view/animation/HtcBaseGlTransAnim;)V

    goto :goto_0
.end method
