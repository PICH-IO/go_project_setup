package paymentmethods

import (
	util_error "thesis_api/pkg/utils/errors"

	"github.com/jmoiron/sqlx"
)

type PaymentService struct {
	r *PaymentResponsitory
}

func NewPaymentService(db *sqlx.DB) *PaymentService {
	return &PaymentService{
		r: NewPaymentRespository(db),
	}
}

func (p *PaymentService) Show() (*PaymentMethodResponse, *util_error.ErrorResponse) {
	return p.r.Show()
}
