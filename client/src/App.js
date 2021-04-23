import React from "react";
import logo from "./logo.svg";
import "./App.css";

function App() {
  const [data, setData] = React.useState(null);

  React.useEffect(() => {
    fetch(process.env.REACT_APP_BACKEND_BASE_URL+"/api")
      .then((res) => res.json())
      .then((data) => setData(data.message))
      .catch(console.log);
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>{!data ? "NO SERVER..." : data}</p>
      </header>
    </div>
  );
}

export default App;