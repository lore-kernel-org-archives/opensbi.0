From: Xiang W <wxjstz@126.com>
Date: Tue, 05 Mar 2024 20:27:29 +0800
Subject: [PATCH] firmware: Prevent _start from not being at the beginning
In-Reply-To: <mvm4jdlt0vt.fsf@suse.de>
References: <20240305103134.874444-1-wxjstz@126.com>
	 <mvm4jdlt0vt.fsf@suse.de>
Message-ID: <0490c4994930eee7f7e9c50030e0a0c704db38d5.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2024-03-05???? 11:43 +0100?Andreas Schwab???
> On M?r 05 2024, Xiang W wrote:
> 
> > There are multiple .entry sections in opensbi, and _start may be put
> > after other .entry sections, which may cause problems. The patch fix
> > this issue.
> 
> That should not be a problem.? Since it is passed as the first object
> file to the linker it is guaranteed to be placed first.
> 
Thank you for your reply

Is this the default behavior of the linker or is there any standard
provision? If there are no standards, modifications will still be?
needed.

Regards,
Xiang W


