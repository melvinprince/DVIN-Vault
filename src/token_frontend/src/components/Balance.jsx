import React, { useState } from "react";
import {token_backend} from "../../../declarations/token_backend";
import { Principal } from "@dfinity/principal";

function Balance() {

  const [inputValue, setValue] = useState("");
  const [balanceResult, setResult] = useState();
  const [isHidden, setHidden] = useState(true);
  
  async function handleClick() {

    // console.log(inputValue);
    const principal = Principal.fromText(inputValue)
    const balance = await token_backend.balanceOf(principal);
    const result = balance + " DVIN";
    // console.log(balance);
    
    setResult(result);
    setHidden(false);
  }


  return (
    <div className="window white">
      <label>Check account token balance:</label>
      <p>
        <input
          id="balance-principal-id"
          type="text"
          placeholder="Enter a Principal ID"
          value={inputValue}
          onChange={(e) => setValue(e.target.value)}
        />
      </p>
      <p className="trade-buttons">
        <button
          id="btn-request-balance"
          onClick={handleClick}
        >
          Check Balance
        </button>
      </p>
      <p hidden={isHidden}>This account has a balance of {balanceResult}.</p>
    </div>
  );
}

export default Balance;
