From: Andreas Schwab <schwab@linux-m68k.org>
Date: Mon, 17 May 2021 13:52:38 +0200
Subject: [PATCH v1 3/3] lib: utils: Replace strcmp with strcmp
In-Reply-To: <20210517113319.25855-4-daniel.schaefer@hpe.com> (Daniel
 Schaefer's message of "Mon, 17 May 2021 19:33:19 +0800")
References: <20210517113319.25855-1-daniel.schaefer@hpe.com>
 <20210517113319.25855-4-daniel.schaefer@hpe.com>
Message-ID: <87zgwt8tmh.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

s/strcmp with strcmp/strcmp with strncmp/

Andreas.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

