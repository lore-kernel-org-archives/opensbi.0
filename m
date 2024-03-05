From: Andreas Schwab <schwab@suse.de>
Date: Tue, 05 Mar 2024 11:43:18 +0100
Subject: [PATCH] firmware: Prevent _start from not being at the beginning
In-Reply-To: <20240305103134.874444-1-wxjstz@126.com> (Xiang W.'s message of
	"Tue, 5 Mar 2024 18:31:03 +0800")
References: <20240305103134.874444-1-wxjstz@126.com>
Message-ID: <mvm4jdlt0vt.fsf@suse.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On M?r 05 2024, Xiang W wrote:

> There are multiple .entry sections in opensbi, and _start may be put
> after other .entry sections, which may cause problems. The patch fix
> this issue.

That should not be a problem.  Since it is passed as the first object
file to the linker it is guaranteed to be placed first.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

