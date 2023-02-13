import { Fragment } from 'inferno';
import { useBackend, useLocalState } from '../backend';
import { Button, Flex, Section, ProgressBar, Slider } from '../components';
import { Window } from '../layouts';

export const RbmkControlRods = (props, context) => {
  const { act, data } = useBackend(context);
  const control_rods = data.control_rods;
  const k = data.k;
  const desiredK = data.desiredK;
  const maxK = data.maxK;
  return (
    <Window
      resizable
      theme="ntos"
      width={300}
      height={300}>
      <Window.Content>
        <Section title="Control Rod Management:">
          Control Rod Insertion:
          <ProgressBar
            value={(control_rods / 100 * 100) * 0.01}
            ranges={{
              good: [0.7, Infinity],
              average: [0.4, 0.7],
              bad: [-Infinity, 0.4],
            }} />
          <br />
          Neutrons per generation (K):
          <br />
          <ProgressBar
            value={(k / 3 * 100) * 0.01}
            ranges={{
              good: [-Infinity, 0.4],
              average: [0.4, 0.6],
              bad: [0.6, Infinity],
            }}>
            {k}
          </ProgressBar>
          <br />
          Target criticality:
          <br />
          <Flex inline width="100%">
            <Flex.Item>
              <Button
                icon="fast-backward"
                disabled={desiredK === 0}
                onClick={() => act('input',
                  { target: 0 })} />
              <Button
                icon="backward"
                disabled={desiredK === 0}
                onClick={() => act('input',
                  { target: (desiredK - 0.1) })} />
            </Flex.Item>
            <Flex.Item grow={1} mx={1}>
              <Slider
                value={desiredK}
                fillValue={k}
                minValue={0}
                maxValue={maxK}
                step={0.1}
                stepPixelSize={5}
                onDrag={(e, value) => act('input', {
                  target: value,
                })} />
            </Flex.Item>
            <Flex.Item>
              <Button
                icon="forward"
                disabled={desiredK === maxK}
                onClick={() => act('input',
                  { target: (desiredK + 0.1) })} />
              <Button
                icon="fast-forward"
                disabled={desiredK === maxK}
                onClick={() => act('input',
                  { target: maxK })} />
            </Flex.Item>
          </Flex>
        </Section>
      </Window.Content>
    </Window>
  );
};
