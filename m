From: Andreas Schwab <schwab@linux-m68k.org>
Date: Mon, 11 Oct 2021 09:55:02 +0200
Subject: [PATCH] lib: sbi: Save context for all non-retentive suspend types
In-Reply-To: <20211011055552.1132025-1-anup.patel@wdc.com> (Anup Patel's
 message of "Mon, 11 Oct 2021 11:25:52 +0530")
References: <20211011055552.1132025-1-anup.patel@wdc.com>
Message-ID: <87ee8sov1l.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Okt 11 2021, Anup Patel wrote:

> Instead of saving context only for default non-retentvie suspend,

Typo: retentive.

Andreas.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

