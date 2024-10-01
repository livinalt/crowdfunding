import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const CrowdGoModule = buildModule("CrowdGoModule", (m) => {


  const crowdGo = m.contract("CrowdGo", []);

  return { crowdGo };
});

export default CrowdGoModule;
