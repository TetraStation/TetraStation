import { Fragment } from 'inferno';
import { toFixed } from 'common/math';
import { useBackend, useLocalState } from '../backend';
import { Button, Flex, Section, ProgressBar, Slider, LabeledList } from '../components';
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
      height={360}>
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
        <Section title="Reactor Status">
          <LabeledList>
            <LabeledList.Item label="Reactor Power">
              <ProgressBar
                value={data.power}
                minValue={0}
                maxValue={120}
                ranges={{
                  good: [30, 70],
                  average: [0, 30],
                  bad: [70, Infinity],
                }}>
                {toFixed(data.power) + ' (%)'}
              </ProgressBar>
            </LabeledList.Item>
            <LabeledList.Item label="Reactor Pressure">
              <ProgressBar
                value={data.reactorPressure}
                minValue={0}
                maxValue={data.pressureMax}
                ranges={{
                  good: [0, 5000],
                  average: [5000, 10000],
                  bad: [10000, Infinity],
                }}>
                {toFixed(data.reactorPressure) + ' (kPa)'}
              </ProgressBar>
            </LabeledList.Item>

            <LabeledList.Item label="Coolant Temperature">
              <ProgressBar
                value={data.coolantInput}
                minValue={0}
                maxValue={data.temperatureMax}
                ranges={{
                  good: [0, 273],
                  average: [274, 373],
                  bad: [374, Infinity],
                }}>
                {toFixed(data.coolantInput) + ' (K)'}
              </ProgressBar>
            </LabeledList.Item>
            <LabeledList.Item label="Outlet Temperature">
              <ProgressBar
                value={data.coolantOutput}
                minValue={0}
                maxValue={data.temperatureMax}
                ranges={{
                  good: [573, 1073],
                  average: [0, 573],
                  bad: [1073, Infinity],
                }}>
                {toFixed(data.coolantOutput) + ' (K)'}
              </ProgressBar>
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
