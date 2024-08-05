From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 5 Aug 2024 18:28:28 +0530
Subject: Announcing the librpmi project
Message-ID: <CAK9=C2WXs+3SEO8kZNTa8S=vagz_Kf7avYUrLv6P7k91-sa+vw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

We are delighted to announce the librpmi project hosted under RISC-V
GitHub at https://github.com/riscv-software-src/librpmi.git

The librpmi is intended to be a common RPMI implementation which can be used by:
a) RISC-V platform vendors to implement RPMI services in their
platform microcontroller firmware
b) System-level partitions to implement RPMI services running as
separate OpenSBI domain
c) Hypervisors/emulators/simulators to emulate RPMI services for the Guest/VM

The librpmi project is very young and we are eager to receive
feedback, participation, and contribution from all RISC-V members and
RISC-V contributors. Currently, the librpmi development and
discussions happen through GitHub pull requests and GitHub issues but
these processes may evolve over time based on community feedback.

Initial testing of the librpmi project has been done by using it to
emulate RPMI services on QEMU RISC-V. These can be tried from the
dev-upstream branch of the following repos:
1) https://github.com/ventanamicro/qemu.git
2) https://github.com/ventanamicro/opensbi.git
3) https://github.com/ventanamicro/linux.git

On behalf of Ventana Micro Systems,
Rahul Pathak, Subrahmanya Lingappa and Anup Patel

