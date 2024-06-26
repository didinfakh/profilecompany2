<?php

namespace App\Utils;

trait ResponseUtil
{
	/**
	 * Allows child classes to override the
	 * status code that is used in their API.
	 *
	 * @var array
	 */
	protected $codes = [
		'created'                   => 201,
		'deleted'                   => 200,
		'updated'                   => 200,
		'no_content'                => 204,
		'invalid_request'           => 400,
		'unsupported_response_type' => 400,
		'invalid_scope'             => 400,
		'temporarily_unavailable'   => 400,
		'invalid_grant'             => 400,
		'invalid_credentials'       => 400,
		'invalid_refresh'           => 400,
		'no_data'                   => 400,
		'invalid_data'              => 400,
		'access_denied'             => 401,
		'unauthorized'              => 401,
		'invalid_client'            => 401,
		'forbidden'                 => 403,
		'resource_not_found'        => 404,
		'not_acceptable'            => 406,
		'resource_exists'           => 409,
		'conflict'                  => 409,
		'resource_gone'             => 410,
		'payload_too_large'         => 413,
		'unsupported_media_type'    => 415,
		'too_many_requests'         => 429,
		'server_error'              => 500,
		'unsupported_grant_type'    => 501,
		'not_implemented'           => 501,
	];

	/**
	 * How to format the response data.
	 * Either 'json' or 'xml'. If blank will be
	 * determine through content negotiation.
	 *
	 * @var string
	 */
	protected $format = 'json';

	//--------------------------------------------------------------------

	/**
	 * Provides a single, simple method to return an API response, formatted
	 * to match the requested format, with proper content-type and status code.
	 *
	 * @param array|string|null $data
	 * @param integer           $status
	 * @param string            $message
	 *
	 * @return mixed
	 */
	public function respond($data = null, int $status = null, string $message = '')
	{
		$status = empty($status) ? 200 : $status;

		return response()->json($data, $status)->setStatusCode($status, $message);
	}

	//--------------------------------------------------------------------

	/**
	 * Used for generic failures that no custom methods exist for.
	 *
	 * @param string|array $messages
	 * @param integer|null $status        HTTP status code
	 * @param string|null  $code          Custom, API-specific, error code
	 * @param string       $customMessage
	 *
	 * @return mixed
	 */
	public function fail($messages, int $status = 400, string $code = null, string $customMessage = '')
	{
		if (!is_array($messages)) {
			$messages = ['error' => $messages];
		}

		$response = [
			'status'   => $status,
			'error'    => $code === null ? $status : $code,
			'messages' => $messages,
		];

		return $this->respond($response, $status, $customMessage);
	}

	public function success($data = null, string $message = '')
	{
		return $this->respond($data, 200, $message);
	}

	//--------------------------------------------------------------------
	//--------------------------------------------------------------------
	// Response Helpers
	//--------------------------------------------------------------------

	/**
	 * Used after successfully creating a new resource.
	 *
	 * @param mixed  $data    Data.
	 * @param string $message Message.
	 *
	 * @return mixed
	 */
	public function respondCreated($data = null, string $message = '')
	{
		return $this->respond($data, $this->codes['created'], $message);
	}

	//--------------------------------------------------------------------

	/**
	 * Used after a resource has been successfully deleted.
	 *
	 * @param mixed  $data    Data.
	 * @param string $message Message.
	 *
	 * @return mixed
	 */
	public function respondDeleted($data = null, string $message = '')
	{
		return $this->respond($data, $this->codes['deleted'], $message);
	}

	/**
	 * Used after a resource has been successfully updated.
	 *
	 * @param mixed  $data    Data.
	 * @param string $message Message.
	 *
	 * @return mixed
	 */
	public function respondUpdated($data = null, string $message = '')
	{
		return $this->respond($data, $this->codes['updated'], $message);
	}

	//--------------------------------------------------------------------

	/**
	 * Used after a command has been successfully executed but there is no
	 * meaningful reply to send back to the client.
	 *
	 * @param string $message Message.
	 *
	 * @return mixed
	 */
	public function respondNoContent(string $message = 'No Content')
	{
		return $this->respond(null, $this->codes['no_content'], $message);
	}

	//--------------------------------------------------------------------

	/**
	 * Used when the client is either didn't send authorization information,
	 * or had bad authorization credentials. User is encouraged to try again
	 * with the proper information.
	 *
	 * @param string $description
	 * @param string $code
	 * @param string $message
	 *
	 * @return mixed
	 */
	public function failUnauthorized(string $description = 'Unauthorized', string $code = null, string $message = '')
	{
		return $this->fail($description, $this->codes['unauthorized'], $code, $message);
	}

	//--------------------------------------------------------------------

	/**
	 * Used when access is always denied to this resource and no amount
	 * of trying again will help.
	 *
	 * @param string $description
	 * @param string $code
	 * @param string $message
	 *
	 * @return mixed
	 */
	public function failForbidden(string $description = 'Forbidden', string $code = null, string $message = '')
	{
		return $this->fail($description, $this->codes['forbidden'], $code, $message);
	}

	//--------------------------------------------------------------------

	/**
	 * Used when a specified resource cannot be found.
	 *
	 * @param string $description
	 * @param string $code
	 * @param string $message
	 *
	 * @return mixed
	 */
	public function failNotFound(string $description = 'Not Found', string $code = null, string $message = '')
	{
		return $this->fail($description, $this->codes['resource_not_found'], $code, $message);
	}

	//--------------------------------------------------------------------

	/**
	 * Used when the data provided by the client cannot be validated.
	 *
	 * @param string $description
	 * @param string $code
	 * @param string $message
	 *
	 * @return mixed
	 */
	public function failValidationError(string $description = 'Bad Request', string $code = null, string $message = '')
	{
		return $this->fail($description, $this->codes['invalid_data'], $code, $message);
	}

	//--------------------------------------------------------------------

	/**
	 * Use when trying to create a new resource and it already exists.
	 *
	 * @param string $description
	 * @param string $code
	 * @param string $message
	 *
	 * @return mixed
	 */
	public function failResourceExists(string $description = 'Conflict', string $code = null, string $message = '')
	{
		return $this->fail($description, $this->codes['resource_exists'], $code, $message);
	}

	//--------------------------------------------------------------------

	/**
	 * Use when a resource was previously deleted. This is different than
	 * Not Found, because here we know the data previously existed, but is now gone,
	 * where Not Found means we simply cannot find any information about it.
	 *
	 * @param string $description
	 * @param string $code
	 * @param string $message
	 *
	 * @return mixed
	 */
	public function failResourceGone(string $description = 'Gone', string $code = null, string $message = '')
	{
		return $this->fail($description, $this->codes['resource_gone'], $code, $message);
	}

	//--------------------------------------------------------------------

	/**
	 * Used when the user has made too many requests for the resource recently.
	 *
	 * @param string $description
	 * @param string $code
	 * @param string $message
	 *
	 * @return mixed
	 */
	public function failTooManyRequests(string $description = 'Too Many Requests', string $code = null, string $message = '')
	{
		return $this->fail($description, $this->codes['too_many_requests'], $code, $message);
	}

	//--------------------------------------------------------------------

	/**
	 * Used when there is a server error.
	 *
	 * @param string      $description The error message to show the user.
	 * @param string|null $code        A custom, API-specific, error code.
	 * @param string      $message     A custom "reason" message to return.
	 *
	 * @return Response The value of the Response's send() method.
	 */
	public function failServerError(string $description = 'Internal Server Error', string $code = null, string $message = '')
	{
		return $this->fail($description, $this->codes['server_error'], $code, $message);
	}
}
