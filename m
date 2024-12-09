From: Richard Hughes <richard@hughsie.com>
Date: Mon, 09 Dec 2024 16:01:42 +0000
Subject: [PATCH 1/1] Add a SBOM template in CycloneDX format
In-Reply-To: <E27C80FB-7AAD-48FB-81F2-AAFC57EB3B32@jrtc27.com>
References: <20241209120653.996455-1-richard@hughsie.com> <20241209120653.996455-2-richard@hughsie.com> <E27C80FB-7AAD-48FB-81F2-AAFC57EB3B32@jrtc27.com>
Message-ID: <L2zXq4ayvAmRO2t_N_GnLTebeZ1r8tjTWMwHQt21Bet-vxgLDqa_1S2lXINWxkVlTx5xOT4A-r60scuREbYkCGvUotYesTaA_4AbCkm5bbM=@hughsie.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, 9 December 2024 at 15:46, Jessica Clarke <jrtc27@jrtc27.com> wrote:
> What turns this template into the actual file? And surely this isn?t
> the right templating for a list here? A set of authors is not a
> singular author?s name.

Right, agreed. The way this works now is that we do a recursive clone of all the firmware components when building either EDK II or coreboot, and then we use a tool called uswid to "find" all the SBOM components and populate the tokenized values automatically. I've written a bit about it here: https://blogs.gnome.org/hughsie/2024/11/14/firmware-sboms-for-open-source-projects/

In the case of OpenSBI the finished component looks like this:

    {
      "type": "library",
      "cpe": "cpe:2.3:a:riscv:opensbi:1.5.1:*:*:*:*:*:*:*",
      "name": "OpenSBI",
      "version": "1.5.1",
      "description": "Open Source Supervisor Binary Interface for RISC-V",
      "bom-ref": "pkg:github/riscv-software-src/opensbi at 1.5.1",
      "externalReferences": [
        {
          "type": "vcs",
          "url": "https://github.com/riscv-software-src/opensbi"
        }
      ],
      "licenses": [
        {
          "license": {
            "url": "https://spdx.org/licenses/BSD-2-Clause.html",
            "id": "BSD-2-Clause"
          }
        }
      ],
      "supplier": {
        "name": "RISC-V Foundation"
      },
      "authors": [
        {
          "name": "Anup Patel, Atish Patra, Bin Meng, Samuel Holland, Xiang W, Damien Le Moal, Heinrich Schuchardt, Yu Chien Peter Lin, Himanshu Chauhan, Inochi Amaoto, Alistair Francis, Andrew Jones, Cl?ment L?ger, Mayuresh Chitale, Nikita Shubin, Vivian Wang, Rahul Pathak, Ivan Orlov, Lad Prabhakar, Jessica Clarke, Xiang Wang, Abner Chang, Ben Zong-You Xie, Guo Ren, Liu Yibin, Nylon Chen, Bo Gan, Dong Du, Olof Johansson, Daniel Schaefer, Jan Remes, Nam Cao, Nick Kossifidis"
        }
      ]
    }

Richard


