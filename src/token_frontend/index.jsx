import ReactDOM from 'react-dom/client'
import React from 'react'
import App from "./src/components/App";
import { AuthClient } from '@dfinity/auth-client';


const init = async () => {
  // console.log("called");

  const root = ReactDOM.createRoot(document.getElementById('root'));
  const authClient = await AuthClient.create();

  if (await authClient.isAuthenticated()) {
    handleAuthentciation(root, authClient); 
    // console.log("Logged in");
       
  } else {
    await authClient.login({
      identityProvider: "https://identity.ic0.app/#authorize",
      onSuccess: () => {
        handleAuthentciation(root, authClient);
      }
    })
  }
}

async function handleAuthentciation(root, authClient) {
  root.render(<App />)
}

init();


