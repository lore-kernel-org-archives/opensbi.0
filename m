From: Vincent Chen <vincent.chen@sifive.com>
Date: Fri, 5 Mar 2021 11:48:47 +0800
Subject: [PATCH 0/3] Support position independent execution
In-Reply-To: <DM6PR04MB6201F9DE09E3E2A522F407C28D979@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <1614698752-16085-1-git-send-email-vincent.chen@sifive.com>
 <DM6PR04MB6201F9DE09E3E2A522F407C28D979@DM6PR04MB6201.namprd04.prod.outlook.com>
Message-ID: <CABvJ_xi8s5ozds1zk0ZpvF_mAL4JBv9117dn2aj=X=UU8jiKow@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 4, 2021 at 3:33 PM Anup Patel <Anup.Patel@wdc.com> wrote:
>
> Hi Vincent,
>
> Overall the changes are in quite good shape.
>
> I have few high-level comments before I can review fw_base.S in detail:
> 1) No need to change toplevel Makefile for appending compiler and linker
>     options. It is better to update $(firmware-genflags-y), $(firmware-cflags-y)
>     and $(firmware-ldflags-y) in firmware/objects.mk
> 2) I would suggest to squash PATCH2 and PATCH3 into one PATCH and
>     make this PATCH as PATCH1
> 3) The current PATCH1 can be PATCH2
>
OK, I got it. I will follow your suggestions to modify this patch.
Thank you.

