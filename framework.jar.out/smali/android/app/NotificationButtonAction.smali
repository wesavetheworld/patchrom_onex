.class public Landroid/app/NotificationButtonAction;
.super Ljava/lang/Object;
.source "NotificationButtonAction.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Landroid/app/NotificationButtonAction;",
            ">;"
        }
    .end annotation
.end field

.field public static final NUM_BUTTONS:I = 0x3


# instance fields
.field private mEnable:[Z

.field private mPendingIntent:[Landroid/app/PendingIntent;

.field private mViewId:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 182
    new-instance v0, Landroid/app/NotificationButtonAction$1;

    invoke-direct {v0}, Landroid/app/NotificationButtonAction$1;-><init>()V

    sput-object v0, Landroid/app/NotificationButtonAction;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 34
    invoke-direct {p0}, Landroid/app/NotificationButtonAction;->init()V

    .line 35
    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .parameter "in"

    .prologue
    .line 145
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 146
    invoke-direct {p0}, Landroid/app/NotificationButtonAction;->init()V

    .line 147
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    const/4 v1, 0x3

    if-ge v0, v1, :cond_2

    .line 148
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_0

    .line 149
    iget-object v1, p0, Landroid/app/NotificationButtonAction;->mEnable:[Z

    const/4 v2, 0x1

    aput-boolean v2, v1, v0

    .line 150
    :cond_0
    iget-object v1, p0, Landroid/app/NotificationButtonAction;->mViewId:[I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    aput v2, v1, v0

    .line 151
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_1

    .line 152
    iget-object v2, p0, Landroid/app/NotificationButtonAction;->mPendingIntent:[Landroid/app/PendingIntent;

    sget-object v1, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/PendingIntent;

    aput-object v1, v2, v0

    .line 147
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 154
    :cond_2
    return-void
.end method

.method private init()V
    .locals 4

    .prologue
    const/4 v3, 0x3

    .line 41
    new-array v1, v3, [Z

    iput-object v1, p0, Landroid/app/NotificationButtonAction;->mEnable:[Z

    .line 42
    new-array v1, v3, [I

    iput-object v1, p0, Landroid/app/NotificationButtonAction;->mViewId:[I

    .line 43
    new-array v1, v3, [Landroid/app/PendingIntent;

    iput-object v1, p0, Landroid/app/NotificationButtonAction;->mPendingIntent:[Landroid/app/PendingIntent;

    .line 45
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v3, :cond_0

    .line 46
    iget-object v1, p0, Landroid/app/NotificationButtonAction;->mEnable:[Z

    const/4 v2, 0x0

    aput-boolean v2, v1, v0

    .line 47
    iget-object v1, p0, Landroid/app/NotificationButtonAction;->mViewId:[I

    const/4 v2, -0x1

    aput v2, v1, v0

    .line 48
    iget-object v1, p0, Landroid/app/NotificationButtonAction;->mPendingIntent:[Landroid/app/PendingIntent;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    .line 45
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 50
    :cond_0
    return-void
.end method


# virtual methods
.method public add(ILandroid/app/PendingIntent;)Z
    .locals 4
    .parameter "viewId"
    .parameter "pendingIntent"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 64
    if-gez p1, :cond_1

    .line 80
    :cond_0
    :goto_0
    return v1

    .line 68
    :cond_1
    if-eqz p2, :cond_0

    .line 72
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    const/4 v3, 0x3

    if-ge v0, v3, :cond_0

    .line 73
    iget-object v3, p0, Landroid/app/NotificationButtonAction;->mEnable:[Z

    aget-boolean v3, v3, v0

    if-nez v3, :cond_2

    .line 74
    iget-object v1, p0, Landroid/app/NotificationButtonAction;->mEnable:[Z

    aput-boolean v2, v1, v0

    .line 75
    iget-object v1, p0, Landroid/app/NotificationButtonAction;->mViewId:[I

    aput p1, v1, v0

    .line 76
    iget-object v1, p0, Landroid/app/NotificationButtonAction;->mPendingIntent:[Landroid/app/PendingIntent;

    aput-object p2, v1, v0

    move v1, v2

    .line 77
    goto :goto_0

    .line 72
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 160
    const/4 v0, 0x0

    return v0
.end method

.method public getPendingIntent(I)Landroid/app/PendingIntent;
    .locals 1
    .parameter "buttonId"

    .prologue
    .line 87
    if-ltz p1, :cond_0

    const/4 v0, 0x3

    if-ge p1, v0, :cond_0

    .line 88
    iget-object v0, p0, Landroid/app/NotificationButtonAction;->mPendingIntent:[Landroid/app/PendingIntent;

    aget-object v0, v0, p1

    .line 89
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getViewId(I)I
    .locals 1
    .parameter "buttonId"

    .prologue
    .line 96
    if-ltz p1, :cond_0

    const/4 v0, 0x3

    if-ge p1, v0, :cond_0

    .line 97
    iget-object v0, p0, Landroid/app/NotificationButtonAction;->mViewId:[I

    aget v0, v0, p1

    .line 98
    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public isEnable()Z
    .locals 3

    .prologue
    .line 114
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    .line 115
    const/4 v1, 0x1

    iget-object v2, p0, Landroid/app/NotificationButtonAction;->mEnable:[Z

    aget-boolean v2, v2, v0

    if-ne v1, v2, :cond_0

    .line 116
    iget-object v1, p0, Landroid/app/NotificationButtonAction;->mEnable:[Z

    aget-boolean v1, v1, v0

    .line 119
    :goto_1
    return v1

    .line 114
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 119
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public isEnable(I)Z
    .locals 1
    .parameter "buttonId"

    .prologue
    .line 105
    if-ltz p1, :cond_0

    const/4 v0, 0x3

    if-ge p1, v0, :cond_0

    .line 106
    iget-object v0, p0, Landroid/app/NotificationButtonAction;->mEnable:[Z

    aget-boolean v0, v0, p1

    .line 107
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 124
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 125
    .local v1, sb:Ljava/lang/StringBuilder;
    const-string v2, "NotificationButtonAction{"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    const/4 v2, 0x3

    if-ge v0, v2, :cond_1

    .line 127
    const/4 v2, 0x1

    iget-object v3, p0, Landroid/app/NotificationButtonAction;->mEnable:[Z

    aget-boolean v3, v3, v0

    if-ne v2, v3, :cond_0

    .line 128
    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 130
    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    const-string v2, " ViewID="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    iget-object v2, p0, Landroid/app/NotificationButtonAction;->mViewId:[I

    aget v2, v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 133
    const-string v2, ", PendingIntent="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    iget-object v2, p0, Landroid/app/NotificationButtonAction;->mPendingIntent:[Landroid/app/PendingIntent;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Landroid/app/PendingIntent;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 138
    :cond_1
    const-string/jumbo v2, "}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 4
    .parameter "out"
    .parameter "flags"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 167
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    const/4 v1, 0x3

    if-ge v0, v1, :cond_2

    .line 168
    iget-object v1, p0, Landroid/app/NotificationButtonAction;->mEnable:[Z

    aget-boolean v1, v1, v0

    if-eqz v1, :cond_0

    move v1, v2

    :goto_1
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 169
    iget-object v1, p0, Landroid/app/NotificationButtonAction;->mViewId:[I

    aget v1, v1, v0

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 170
    iget-object v1, p0, Landroid/app/NotificationButtonAction;->mPendingIntent:[Landroid/app/PendingIntent;

    aget-object v1, v1, v0

    if-eqz v1, :cond_1

    .line 171
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 172
    iget-object v1, p0, Landroid/app/NotificationButtonAction;->mPendingIntent:[Landroid/app/PendingIntent;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1, v3}, Landroid/app/PendingIntent;->writeToParcel(Landroid/os/Parcel;I)V

    .line 167
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    move v1, v3

    .line 168
    goto :goto_1

    .line 174
    :cond_1
    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_2

    .line 177
    :cond_2
    return-void
.end method
