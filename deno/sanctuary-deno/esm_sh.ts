import S from "https://esm.sh/sanctuary";

const a = S.Just(1);
console.log(a);
const b = S.map((x: number) => x + 1)(a);
console.log(b);
