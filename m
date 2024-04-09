From: Pope B.Lei <popeblei@gmail.com>
Date: Tue, 9 Apr 2024 09:40:41 +0800
Subject: Please review path about lib: sbi: Refine the settings for switching
 to Virtual Supervisor Mode.
Message-ID: <CAECSvgYz2RCRNdHZEnCM-ftLQhMOZ_CwRCgdYxG+FGQ9sj6gLw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dear All:
     I discovered a subtle bug during the process of switching to VS
mode. The issue arises because, even though Mstatus.MPV is set, before
executing mret, one should access the VS mode registers using their
actual addresses, rather than using the pseudonyms of the S registers.

Best Regards!

Boswell Lei
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-lib-sbi-Refine-the-settings-for-switching-to-Virtual.patch
Type: application/octet-stream
Size: 1408 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20240409/dcb2b871/attachment.obj>
