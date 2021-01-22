From: Vincent Chen <vincent.chen@sifive.com>
Date: Fri, 22 Jan 2021 12:10:47 +0800
Subject: Questions for OpenSBI to support position independent execution
Message-ID: <CABvJ_xh87_8omB+E-e3h4OuQXJEdfbL46D4mNr6mx2Y4oJG4NA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,
For the current implementation,  if we configure the OpenSBI as the
generic platform, we can execute the same OpenSBI image on the
different platforms. It eliminates many troubles in use. However, I
found there is an assumption that the OpenSBI only can run at the same
address (default: 0x80000000). If users want to change the OpenSBI
running address due to platform memory layout or other reasons, users
need to change the FW_TEXT_START and recompile the OpenSBI. In this
case, users still need to prepare multiple images for different
platforms. In order to overcome this issue, I am evaluating the
feasibility of enabling OpenSBI to support position-independent
execution. If someone has any concerns about this issue or any
suggestions, please let me know. Thanks

In addition, when I review the current implementation, I encounter a
question shown below. After OpenSBI enables to support the
position-independent execution, ideally, the code can run at an
arbitrary place. Hence, I think the codes could be removed from
firmware/fw_base.S, which are used to copy the code from the load
address to the run address. Before removing them, I want to know the
original purpose and usages of these codes, but I can't find them. If
some can tell me the answer, I would appreciate it.

Best regards,
Vincent

