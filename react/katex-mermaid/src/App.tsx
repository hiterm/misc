import { useEffect, useRef, useState } from "react";
import "katex/dist/katex.min.css";
import "./App.css";
import katex from "katex";

function KaTeX() {
  const element = useRef(null);

  useEffect(() => {
    katex.render("c = \\pm\\sqrt{a^2 + b^2}", element.current!, {
      throwOnError: false,
    });
  });

  return <div ref={element} className="App"></div>;
}

const App: React.FC = () => {
  return <KaTeX />;
};

export default App;
