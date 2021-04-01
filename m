From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Thu, 1 Apr 2021 13:17:20 +0100
Subject: [PATCH] firmware: Remove redundant add instruction from trap
 restore path
In-Reply-To: <20210401111945.318643-1-anup.patel@wdc.com>
References: <20210401111945.318643-1-anup.patel@wdc.com>
Message-ID: <02D9B822-5A8D-4F94-89F3-5BB451429632@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1 Apr 2021, at 12:19, Anup Patel <anup.patel@wdc.com> wrote:
> 
> The "add sp, a0, zero" instruction in the trap restore path is redundant
> and can be avoided if TRAP_RESTORE_xyz() assembly macros use a0 as the
> base register instead of sp.

Are interrupts disabled at this point?

Jess


