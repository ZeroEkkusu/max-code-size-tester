## Max Code Size Tester

**Test `MAX_CODE_SIZE` of your EVM.**

[`MAX_CODE_SIZE`](https://eips.ethereum.org/EIPS/eip-170) refers to the maximum length of a smart contract's runtime bytecode.

Runtime bytecode is different from creation bytecode. For example, the Solidity compiler generates creation bytecode (binary) from source code (Solidity). When this creation bytecode is deployed onchain, it gets executed, and returns runtime bytecode, which is set as the code of the smart contract.

## Usage

> [!CAUTION]
> This program deploys a smart contract onchain to verify `MAX_CODE_SIZE`. If run in a production environment, it will incur real transaction costs. Use only in test networks unless you fully understand the implications.

<details>

<summary><b>I have read and understood the above warning. Show me the usage instructions.</b></summary>

<br>

**Prerequisites**

```shell
curl -L https://foundry.paradigm.xyz | bash
```

**Get**

```shell
git clone git@github.com:ZeroEkkusu/max-code-size-tester.git
cd max-code-size-tester
forge install
```

**Run**

```shell
forge script MaxCodeSizeTester \
  --rpc-url <rpc_url> \
  --broadcast \
  --private-key <private_key> \
  --sig "run(uint256)" \
  <code_size>
```

It is recommended to test `code_size` of

- $max - 1$
- $max$
- $max + 1$

where $max$ is the `MAX_CODE_SIZE` of the EVM in bytes.

Only $max + 1$ should fail.

</details>

## License
​
Licensed under either of

- Apache License, Version 2.0, ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
- MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)

at your option.

Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in the work by you, as defined in the Apache-2.0 license, shall be dual licensed as above, without any additional terms or conditions.

---

© 2024 Zero Ekkusu