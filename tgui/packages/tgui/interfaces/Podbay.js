import { useBackend } from '../backend';
import { Box, Button, Flex, Section, LabeledList } from '../components';
import { Window } from '../layouts';

export const Podbay = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    exteriorClosed,
    interiorClosed,
    busy,
    error,
  } = data;
  return (
    <Window
      width={360}
      height={420}>
      <Window.Content>
        <Section title="Airlock Status">
          <LabeledList>
            <LabeledList.Item label="Controller">
              <Button
                content="Busy"
                icon="sync"
                color="yellow"
                disabled={!busy} />
              <Button
                content="Error"
                icon="wrench"
                color="red"
                disabled={!error} />
            </LabeledList.Item>
            <LabeledList.Item label="Internal Door">
              <Button
                content="Close"
                color="green"
                onClick={() => act('close_interior', {})}
                disabled={interiorClosed} />
              <Button
                content="Open"
                color="red"
                onClick={() => act('open_interior', {})}
                disabled={!interiorClosed} />
            </LabeledList.Item>
            <LabeledList.Item label="External Door">
              <Button
                content="Close"
                color="green"
                onClick={() => act('close_exterior', {})}
                disabled={exteriorClosed} />
              <Button
                content="Open"
                color="red"
                onClick={() => act('open_exterior', {})}
                disabled={!exteriorClosed} />
            </LabeledList.Item>
          </LabeledList>
          <Button
            content="Cycle"
            fluid="true"
            onClick={() => act('cycle', {})} />
        </Section>
      </Window.Content>
    </Window>
  );
};
