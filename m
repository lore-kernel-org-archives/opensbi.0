From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Sat, 6 Mar 2021 08:02:53 +0100
Subject: SBI spec: return code for non-available extension
Message-ID: <d9edc754-1153-1de8-f6ff-f1d106d17cba@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Software may by fault invoke an extension which is not available.

OpenSBI actually returns SBI_ERR_NOT_SUPPORTED from sbi_ecall_handler()
in this case.

This is a reasonable choice but I could not find any basis in the SBI
specification. The handling of an ecall for an unsupported EID is not
described.

I think this gap should be closed in the spec.

Best regards

Heinrich

