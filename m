From: Andreas Schwab <schwab@linux-m68k.org>
Date: Tue, 27 Dec 2022 19:39:25 +0100
Subject: [PATCH 1/1] platform: generic: allwinner: avoid buffer overrun
In-Reply-To: <da726834-79af-8e40-c39e-a6dd4c421ea4@sholland.org> (Samuel
	Holland's message of "Tue, 27 Dec 2022 12:22:22 -0600")
References: <20221227110129.145976-1-heinrich.schuchardt@canonical.com>
	<CAEUhbmX9u1Fpy-ZQP=Gyp=-jwc5OzRM7XziCkydLcsQqYBivKg@mail.gmail.com>
	<374eb91d-e580-3583-accf-0d0e3a3687ea@canonical.com>
	<CAEUhbmUbaAYp-dcEYF845XX66ZGFLPkNuJMp2xpkpPLNZ3o4MQ@mail.gmail.com>
	<87cz85dmmd.fsf@igel.home>
	<CAEUhbmXcQiGH6WQ3pN_C+mv_qRn0mF2Pb2vq_dxeXxMsygNwdw@mail.gmail.com>
	<da726834-79af-8e40-c39e-a6dd4c421ea4@sholland.org>
Message-ID: <87v8lwd736.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Dez 27 2022, Samuel Holland wrote:

> Anything else is either wrong or wasting space.

Not wasting space:

diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
index d633514..901ffaa 100644
--- a/lib/utils/irqchip/plic.c
+++ b/lib/utils/irqchip/plic.c
@@ -39,14 +39,14 @@ static void plic_set_priority(const struct plic_data *plic, u32 source, u32 val)
 void plic_priority_save(const struct plic_data *plic, u8 *priority, u32 num)
 {
 	for (u32 i = 1; i <= num; i++)
-		priority[i] = plic_get_priority(plic, i);
+		priority[i - 1] = plic_get_priority(plic, i);
 }
 
 void plic_priority_restore(const struct plic_data *plic, const u8 *priority,
 			   u32 num)
 {
 	for (u32 i = 1; i <= num; i++)
-		plic_set_priority(plic, i, priority[i]);
+		plic_set_priority(plic, i, priority[i - 1]);
 }
 
 static u32 plic_get_thresh(const struct plic_data *plic, u32 cntxid)

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

