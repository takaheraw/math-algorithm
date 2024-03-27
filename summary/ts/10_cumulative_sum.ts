const visitors: number[] = [62, 65, 41, 13, 20, 11, 18, 44, 53, 12, 18, 17, 14, 10, 39];
const accumulates: number[] = new Array(visitors.length + 1).fill(0);

for (let i = 1; i <= visitors.length; i++) {
  accumulates[i] = accumulates[i - 1] + visitors[i - 1];
}

const targets: [number, number][] = [[2, 4], [4, 13]];
targets.forEach(([l, r]) => {
  console.log(`${l}日目から${r}日目までの来場者数`);
  console.log(accumulates[r] - accumulates[l - 1]);
});
