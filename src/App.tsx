import React from 'react';
import './App.css';
import { Types, AptosClient } from 'aptos';

const client = new AptosClient('https://fullnode.devnet.aptoslabs.com/v1');
function App() {
  const [address, setAddress] = React.useState<string | null>(null);
  // const [account, setAccount] = React.useState<Types.AccountData | null>(null);
  // const [modules, setModules] = React.useState<Types.MoveModuleBytecode[]>([]);
  const [totalCount,setTotalCount] = React.useState(0)
  const [IsLogIn, setIsLogIn] = React.useState(false);
  const LogIn = async() =>{
    const { address, publicKey } = await window.aptos.connect();
    setAddress(address);
    setIsLogIn(true);
    //setTotalCount(totalCount +1)
  }
  function increase(){
    {!IsLogIn && alert("Please connect wallet") }
    {IsLogIn && setTotalCount(totalCount +1)}
  }

  return (<div className='App'>
    <h1>Hello Aptos Users</h1>
    <div>
    <button className='login' onClick={LogIn} >Connect Wallet</button></div>
    <h4>Account address:{address}</h4>
    <button className='click' onClick={increase}>Click here</button>
    <h3>Total Count: {totalCount}</h3>
  </div>);
}
export default App;