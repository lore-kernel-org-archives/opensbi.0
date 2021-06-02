From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Wed, 2 Jun 2021 02:54:44 +0100
Subject: [PATCH] firmware: Do not allow harts with different XLEN to boot
In-Reply-To: <20210602014201.246899-1-atish.patra@wdc.com>
References: <20210602014201.246899-1-atish.patra@wdc.com>
Message-ID: <85A3CECC-5E4B-4A0B-A93A-DC36E5E12504@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2 Jun 2021, at 02:42, Atish Patra <atish.patra@wdc.com> wrote:
> 
> OpenSBI is built separately for RV32/RV64. Thus, it shouldn't try to boot
> harts with a different XLEN compared to what it is compiled with.
> 
> This patch fixes the issue observed in beagleV which has two U74(RV64) and
> one E24 (RV32) harts.

Is this really necessary? Can the different clusters not boot different
OpenSBIs? This is a really gross hack for what seems like a stupid
hardware decision if they both blindly load and run from the same place.

Jess


