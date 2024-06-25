type State = {
    sequence: string;
    score: number;
};

function beamSearch(startState: State, expand: (state: State) => State[], beamWidth: number, goalTest: (state: State) => boolean): State | null {
    // 初期のビームを設定
    let beam: State[] = [startState];
    
    // 探索ループ
    while (beam.length > 0) {
        // 各状態を展開し、候補を収集
        let candidates: State[] = [];
        for (let state of beam) {
            if (goalTest(state)) {
                return state; // 目標状態に到達したら終了
            }
            candidates.push(...expand(state));
        }
        
        // スコアに基づいて候補をソートし、上位ビーム幅の候補を選択
        candidates.sort((a, b) => b.score - a.score); // スコアが高い順にソート
        beam = candidates.slice(0, beamWidth);
    }
    
    return null; // 目標状態に到達できなかった場合
}

// 展開関数の例
function expand(state: State): State[] {
    // 状態を展開して次の状態の配列を返す
    // この例では文字列の各文字に 'a' または 'b' を追加
    const nextStates: State[] = [];
    const nextChars = ['a', 'b'];

    for (let char of nextChars) {
        const newSequence = state.sequence + char;
        const newScore = evaluate(newSequence); // スコアリング関数
        nextStates.push({ sequence: newSequence, score: newScore });
    }

    return nextStates;
}

// スコアリング関数の例
function evaluate(sequence: string): number {
    // ここでは単純に文字列の長さをスコアとして使用
    return sequence.length;
}

// 目標状態判定関数の例
function goalTest(state: State): boolean {
    // 例えば、文字列が 'aaa' になったら目標状態とする
    return state.sequence === 'aaa';
}

// 初期状態
const startState: State = { sequence: '', score: 0 };

// ビームサーチの実行
const result = beamSearch(startState, expand, 2, goalTest);

if (result) {
    console.log(`Goal found: ${result.sequence}`);
} else {
    console.log('Goal not found');
}
