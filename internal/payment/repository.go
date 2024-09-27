package paymentmethods

import (
	util_error "thesis_api/pkg/utils/errors"

	"github.com/jmoiron/sqlx"
)

type PaymentResponsitory struct {
	db *sqlx.DB
}

func NewPaymentRespository(db *sqlx.DB) *PaymentResponsitory {
	return &PaymentResponsitory{
		db: db,
	}
}

func (p *PaymentResponsitory) Show() (*PaymentMethodResponse, *util_error.ErrorResponse) {
	var payment = paymentmMthods
	// fmt.Println(payment)
	if len(payment.PaymentMethods) <= 0 {
		err := &util_error.ErrorResponse{
			MessageID:    "DataNotFound",
			ErrorMessage: "query data not success",
		}
		return nil, err
	}
	return &payment, nil
}
