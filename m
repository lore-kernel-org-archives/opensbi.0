From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Fri, 20 Dec 2024 16:01:59 +0000
Subject: RFC: big endian support for riscv64/opensbi
Message-ID: <20241220160206.1989527-1-ben.dooks@codethink.co.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is part of our project to investigate big endian on RISC-V.
The full information is documented on our gitlab[1] which includes
source repositories, build information and project documentation.

We have a minimal buildroot, qemu and kernel working on QEMU.

As this is a work in progress any review or help is appreciated.

[1] https://gitlab.com/CodethinkLabs/riscv_bigendian



