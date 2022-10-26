<?php

/**
 * This code was generated by
 * \ / _    _  _|   _  _
 * | (_)\/(_)(_|\/| |(/_  v1.0.0
 * /       /
 */

namespace Twilio\Rest\IpMessaging\V1\Service\Channel;

use Twilio\Options;
use Twilio\Values;

abstract class MemberOptions {
    /**
     * @param string $roleSid The role_sid
     * @return CreateMemberOptions Options builder
     */
    public static function create(string $roleSid = Values::NONE): CreateMemberOptions {
        return new CreateMemberOptions($roleSid);
    }

    /**
     * @param string[] $identity The identity
     * @return ReadMemberOptions Options builder
     */
    public static function read(array $identity = Values::ARRAY_NONE): ReadMemberOptions {
        return new ReadMemberOptions($identity);
    }

    /**
     * @param string $roleSid The role_sid
     * @param int $lastConsumedMessageIndex The last_consumed_message_index
     * @return UpdateMemberOptions Options builder
     */
    public static function update(string $roleSid = Values::NONE, int $lastConsumedMessageIndex = Values::NONE): UpdateMemberOptions {
        return new UpdateMemberOptions($roleSid, $lastConsumedMessageIndex);
    }
}

class CreateMemberOptions extends Options {
    /**
     * @param string $roleSid The role_sid
     */
    public function __construct(string $roleSid = Values::NONE) {
        $this->options['roleSid'] = $roleSid;
    }

    /**
     * The role_sid
     *
     * @param string $roleSid The role_sid
     * @return $this Fluent Builder
     */
    public function setRoleSid(string $roleSid): self {
        $this->options['roleSid'] = $roleSid;
        return $this;
    }

    /**
     * Provide a friendly representation
     *
     * @return string Machine friendly representation
     */
    public function __toString(): string {
        $options = \http_build_query(Values::of($this->options), '', ' ');
        return '[Twilio.IpMessaging.V1.CreateMemberOptions ' . $options . ']';
    }
}

class ReadMemberOptions extends Options {
    /**
     * @param string[] $identity The identity
     */
    public function __construct(array $identity = Values::ARRAY_NONE) {
        $this->options['identity'] = $identity;
    }

    /**
     * The identity
     *
     * @param string[] $identity The identity
     * @return $this Fluent Builder
     */
    public function setIdentity(array $identity): self {
        $this->options['identity'] = $identity;
        return $this;
    }

    /**
     * Provide a friendly representation
     *
     * @return string Machine friendly representation
     */
    public function __toString(): string {
        $options = \http_build_query(Values::of($this->options), '', ' ');
        return '[Twilio.IpMessaging.V1.ReadMemberOptions ' . $options . ']';
    }
}

class UpdateMemberOptions extends Options {
    /**
     * @param string $roleSid The role_sid
     * @param int $lastConsumedMessageIndex The last_consumed_message_index
     */
    public function __construct(string $roleSid = Values::NONE, int $lastConsumedMessageIndex = Values::NONE) {
        $this->options['roleSid'] = $roleSid;
        $this->options['lastConsumedMessageIndex'] = $lastConsumedMessageIndex;
    }

    /**
     * The role_sid
     *
     * @param string $roleSid The role_sid
     * @return $this Fluent Builder
     */
    public function setRoleSid(string $roleSid): self {
        $this->options['roleSid'] = $roleSid;
        return $this;
    }

    /**
     * The last_consumed_message_index
     *
     * @param int $lastConsumedMessageIndex The last_consumed_message_index
     * @return $this Fluent Builder
     */
    public function setLastConsumedMessageIndex(int $lastConsumedMessageIndex): self {
        $this->options['lastConsumedMessageIndex'] = $lastConsumedMessageIndex;
        return $this;
    }

    /**
     * Provide a friendly representation
     *
     * @return string Machine friendly representation
     */
    public function __toString(): string {
        $options = \http_build_query(Values::of($this->options), '', ' ');
        return '[Twilio.IpMessaging.V1.UpdateMemberOptions ' . $options . ']';
    }
}