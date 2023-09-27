From: Andreas Schwab <schwab@linux-m68k.org>
Date: Wed, 27 Sep 2023 18:47:29 +0200
Subject: [PATCH 1/1] lib: utils: Simplify SET_ISA_EXT_MAP()
In-Reply-To: <bdae373d-843d-4f5b-b7a8-24724f6eef2c@canonical.com> (Heinrich
	Schuchardt's message of "Wed, 27 Sep 2023 17:38:25 +0200")
References: <20230927142103.52016-1-heinrich.schuchardt@canonical.com>
	<ea8d5b17416fc2e593c5b64c0bc6f893eaf050d3.camel@126.com>
	<bdae373d-843d-4f5b-b7a8-24724f6eef2c@canonical.com>
Message-ID: <87edijmula.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sep 27 2023, Heinrich Schuchardt wrote:

> Just to be clear this is not what the incoming code did.

Though perhaps indented, given the use of continue throughout the loop.
The wrapping with do/while was probably an afterthought.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

